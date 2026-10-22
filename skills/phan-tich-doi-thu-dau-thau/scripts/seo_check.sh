#!/usr/bin/env bash
# Kiểm tra nhanh khả năng lập chỉ mục: robots.txt, noindex, sitemap, canonical, SSR/JS, RDAP.
# Dùng: ./seo_check.sh https://example.vn [https://other.vn ...]
set -u
UA="Mozilla/5.0 (compatible; seo-check/1.0)"
for URL in "$@"; do
  URL="${URL%/}"; HOST=$(echo "$URL" | sed -E 's#^https?://##; s#/.*##')
  echo "=== $URL"
  CODE=$(curl -s -o /dev/null -w '%{http_code}' -A "$UA" -L --max-time 20 "$URL/"); echo "HTTP: $CODE"
  ROBOTS=$(curl -s -A "$UA" -L --max-time 15 "$URL/robots.txt")
  echo "robots.txt Disallow (User-agent *):"; echo "$ROBOTS" | grep -iE '^(disallow|sitemap):' | head -20 | sed 's/^/  /'
  echo "$ROBOTS" | grep -qiE '^disallow:[[:space:]]*/[[:space:]]*$' && echo "  !! Disallow: / (chặn toàn site)"
  HDR=$(curl -sI -A "$UA" -L --max-time 15 "$URL/" | grep -i '^x-robots-tag' ); echo "X-Robots-Tag: ${HDR:-none}"
  HTML=$(curl -s -A "$UA" -L --max-time 20 "$URL/")
  echo "meta robots: $(echo "$HTML" | grep -ioE '<meta[^>]+name=["'"'"']robots["'"'"'][^>]*>' | head -1 || true)"
  echo "$HTML" | grep -qiE 'noindex' && echo "  !! có chuỗi noindex trong HTML"
  C=$(echo "$HTML" | grep -ioE '<link[^>]+rel=["'"'"']canonical["'"'"'][^>]*>' | head -1); echo "canonical: ${C:-none}"
  TEXT=$(echo "$HTML" | sed -E 's/<script[^>]*>.*<\/script>//g; s/<[^>]+>/ /g' | wc -w)
  echo "HTML bytes: ${#HTML}, words (ước tính): $TEXT  -> $( [ "$TEXT" -lt 150 ] && echo 'có thể JS-render' || echo 'có nội dung SSR')"
  SM=$(echo "$ROBOTS" | grep -i '^sitemap:' | head -1 | awk '{print $2}' | tr -d '\r'); SM=${SM:-$URL/sitemap.xml}
  SC=$(curl -s -o /tmp/sm.$$ -w '%{http_code}' -A "$UA" -L --max-time 20 "$SM")
  echo "sitemap: $SM -> HTTP $SC, <loc>: $(grep -o '<loc>' /tmp/sm.$$ 2>/dev/null | wc -l)"; rm -f /tmp/sm.$$
  BASE=$(echo "$HOST" | awk -F. '{ if ($(NF-1) ~ /^(com|net|org|edu|gov|info)$/ && NF>2) print $(NF-2)"."$(NF-1)"."$NF; else print $(NF-1)"."$NF }')
  REG=$(curl -s -L --max-time 20 "https://rdap.org/domain/$BASE" | grep -oE '"eventAction" *: *"registration" *, *"eventDate" *: *"[^"]+"' | grep -oE '[0-9]{4}-[0-9]{2}-[0-9]{2}' | head -1)
  echo "RDAP $BASE registration: ${REG:-? (không có RDAP, .vn thường cần tra whois.vn)}"
  echo
done
