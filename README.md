# Skill Claude: Phân tích đối thủ nền tảng đấu thầu Việt Nam

Skill giúp Claude phân tích đối thủ của các nền tảng thông tin đấu thầu (dauthau.asia / DauThau.info): tìm đối thủ, kiểm tra SEO, thu thập tính năng và giá, dựng ma trận tính năng và thẻ phân tích từng nền tảng (MSC/e-GP, Anovatech, ThauSo, BidWinner, ChamThau, VietLex...).

## Cấu trúc
```
skills/phan-tich-doi-thu-dau-thau/
├── SKILL.md                          # quy trình từng bước
├── references/competitors-2026-10.md # ảnh chụp kết quả 22/10/2026
└── scripts/seo_check.sh              # kiểm tra robots/noindex/sitemap/canonical/RDAP
phan-tich-doi-thu-dau-thau.zip        # bản nén để tải lên Claude.ai
```

## Cài cho Claude Code
Cách 1 – skill cá nhân:
```bash
git clone https://github.com/huydepzai121/dauthau-competitor-analysis-skill.git
cp -r dauthau-competitor-analysis-skill/skills/phan-tich-doi-thu-dau-thau ~/.claude/skills/
```
(hoặc copy vào `.claude/skills/` của một dự án để dùng chung cho team).

Cách 2 – plugin (repo có `.claude-plugin/marketplace.json`):
```
/plugin marketplace add huydepzai121/dauthau-competitor-analysis-skill
/plugin install dauthau-competitor-analysis@dauthau-competitor-analysis-skill
```

## Cài cho Claude.ai
1. Tải `phan-tich-doi-thu-dau-thau.zip` (trong repo hoặc mục Releases).
2. Settings → Capabilities → Skills → Upload skill → chọn file zip.
3. Bật skill, rồi hỏi ví dụ: "Phân tích đối thủ của dauthau.asia".

## Dùng script SEO
```bash
bash skills/phan-tich-doi-thu-dau-thau/scripts/seo_check.sh https://www.chamthau.com https://bidwinner.info
```
Cần `curl`. RDAP không hỗ trợ một số đuôi (.vn, .info qua rdap.org) – khi đó tra whois thủ công.

## Lưu ý
Dữ liệu trong `references/` có ngày; giá và tính năng đối thủ thay đổi nhanh, hãy kiểm tra lại. Chỉ ghi thông tin đã xác minh, kèm nguồn.

Giấy phép: MIT.
