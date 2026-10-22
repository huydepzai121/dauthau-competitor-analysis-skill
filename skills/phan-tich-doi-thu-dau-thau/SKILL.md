---
name: phan-tich-doi-thu-dau-thau
description: Phân tích đối thủ cạnh tranh của nền tảng thông tin đấu thầu Việt Nam (dauthau.asia / DauThau.info) – tìm đối thủ, kiểm tra SEO/lập chỉ mục, thu thập tính năng và bảng giá, dựng ma trận tính năng và thẻ phân tích từng nền tảng. Dùng khi người dùng hỏi về đối thủ đấu thầu, so sánh với MSC/e-GP (muasamcong), Anovatech, ThauSo, BidWinner, ChamThau, VietLex. Keywords: Vietnam bidding, tender intelligence, procurement platform, competitor analysis, feature matrix, pricing, SEO audit, muasamcong, e-GP.
---

# Phân tích đối thủ nền tảng đấu thầu Việt Nam

Mục tiêu: cho chủ dauthau.asia một bức tranh **đã xác minh** về đối thủ: ai là đối thủ, họ có tính năng gì, giá bao nhiêu, mạnh/yếu ở đâu, và dauthau.asia nên làm gì tiếp.

Ảnh chụp kết quả trước đó: `references/competitors-2026-10.md` (dùng làm điểm xuất phát, luôn kiểm tra lại vì dữ liệu có ngày).

## Quy tắc bắt buộc
1. Chỉ ghi sự thật đã xác minh từ trang nguồn; mỗi khẳng định kèm URL.
2. Không có bằng chứng → ghi `?`. Có bằng chứng là không có → `✗`. Có → `✓` + chi tiết ngắn (gói, giới hạn).
3. Phân biệt "tự nêu" (quảng cáo của họ) với "đã kiểm chứng"; "sắp ra mắt" không tính là có.
4. Ghi ngày xác minh (dd/mm/yyyy). Trang chặn bot hoặc chỉ hiện giá bằng JS → nói rõ, thử trình duyệt thật trước khi kết luận.
5. Không đưa dữ liệu cá nhân, token, mật khẩu vào báo cáo.

## Bước 1 – Tìm đối thủ
Truy vấn gợi ý (tiếng Việt, kết hợp năm hiện tại):
- `tra cứu thông tin đấu thầu`, `phần mềm săn gói thầu`, `cảnh báo gói thầu qua email zalo`
- `tra cứu kết quả lựa chọn nhà thầu`, `giá trúng thầu hàng hóa tra cứu`, `AI đọc hồ sơ mời thầu`
- `thông báo mời thầu hôm nay`, `phân tích đối thủ đấu thầu`, `bid intelligence Vietnam`, `Vietnam tender alerts`
- `site:*.vn đấu thầu dữ liệu`, tìm "alternative to dauthau.info"
Loại trừ: chính dauthau.asia/dauthau.info và hệ sinh thái (dauthau.net); MSC (muasamcong.mpi.gov.vn) **chỉ** đưa vào như mốc so sánh nếu người dùng yêu cầu; báo/tin tức (baodauthau.vn) chỉ xếp "cạnh tranh từ khóa"; trang văn bản luật đơn thuần.
Phân loại: Cạnh tranh cao (cùng sản phẩm: gom thầu + cảnh báo + phân tích) / trung bình / chỉ từ khóa SEO.

## Bước 2 – Xác minh site
Với mỗi site: mở trang chủ (HTTP 200?), đọc giới thiệu, tính năng, bảng giá, điều khoản; ghi chủ sở hữu/MST nếu công khai; tuổi tên miền qua RDAP. Bỏ site chết, đỗ tên miền, hoặc chỉ là bản sao.

## Bước 3 – SEO / khả năng lập chỉ mục
Chạy `scripts/seo_check.sh https://domain` (robots.txt, meta robots/X-Robots-Tag noindex, sitemap, canonical, kích thước HTML và số chữ để đoán SSR hay JS-render, RDAP ngày đăng ký). Diễn giải:
- Bị `Disallow: /` hoặc noindex → Google không lập chỉ mục.
- Không sitemap/canonical, sitemap ít URL, HTML gần rỗng (JS-render) → khó index sâu.
- Tên miền mới (< 1 năm), tên miền phụ → uy tín thấp, xếp hạng kém.
Không khẳng định thứ hạng nếu không tra được Google trực tiếp.

## Bước 4 – Thu thập tính năng & giá
Đọc trang tính năng, hướng dẫn, bảng giá, blog cập nhật. Ghi: gói, giá/năm (quy đổi nếu theo ngày), giới hạn (số bộ lọc, người dùng, tần suất email), dùng thử. Nếu giá tải bằng JS, dùng trình duyệt headless (Playwright) để đọc.

## Bước 5 – Ma trận tính năng
Cột: DauThau.asia, MSC (e-GP) nếu cần, rồi từng đối thủ. Hàng tối thiểu:
| Nhóm | Hàng |
|---|---|
| Dữ liệu | TBMT, KHLCNT, KQLCNT, biên bản mở thầu, yêu cầu báo giá, xem/tải HSMT, thầu tư nhân/quốc tế/ODA/đấu giá, lịch sử dữ liệu, tần suất cập nhật |
| Phân tích | Hồ sơ nhà thầu, phân tích đối thủ, hồ sơ chủ đầu tư/BMT, giá trúng hàng hóa, AI đọc HSMT, dự đoán trúng / điểm phù hợp, dự đoán đối thủ |
| Cảnh báo & xuất | Cảnh báo email, Zalo, SMS, số bộ lọc, theo dõi gói, API/MCP, xuất Excel/CSV, ứng dụng mobile |
| Giá | Miễn phí gì, giá công khai, dùng thử |

## Bước 6 – Thẻ từng nền tảng
Mỗi nền tảng một thẻ, ngắn, dễ lướt:
- **Tóm tắt** 1 câu (bản chất, định vị).
- **Nhãn** xanh (mạnh) / đỏ (hạn chế): ví dụ "Có AI", "Zalo", "Cần chứng thư số".
- **3 chỉ số** nổi bật (số bộ lọc, quy mô dữ liệu, giá).
- **Điểm mạnh** / **Hạn chế**: 3–6 gạch đầu dòng, mỗi dòng ≤ 1 câu.
- **Bảng phí/gói** nhỏ nếu có.
- **Nguồn**: URL.
Không viết đoạn văn dài kiểu "Dữ liệu: ... Thông báo: ...".

## Bước 7 – Kết luận cho dauthau.asia
- Đối thủ mạnh nhất và lý do (1–3 câu).
- So từng gói dauthau.asia với lựa chọn gần nhất của đối thủ (giá, rủi ro bị thay thế).
- Tính năng còn thiếu, xếp ưu tiên Cao/TB/Thấp.
- Mối đe dọa / cơ hội.
- Đề xuất theo dõi định kỳ (giá, tính năng mới, sitemap/SEO).
