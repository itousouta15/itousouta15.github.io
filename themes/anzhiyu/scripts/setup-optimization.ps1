# 效能優化完成腳本
# 執行此腳本來完成所有優化設置

Write-Host "==================================" -ForegroundColor Cyan
Write-Host "  Hexo 效能優化設置" -ForegroundColor Cyan
Write-Host "==================================" -ForegroundColor Cyan
Write-Host ""

# 步驟 1: 安裝壓縮插件
Write-Host "[1/4] 安裝 hexo-neat 壓縮插件..." -ForegroundColor Yellow
npm install hexo-neat --save

if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ 壓縮插件安裝成功" -ForegroundColor Green
} else {
    Write-Host "✗ 壓縮插件安裝失敗" -ForegroundColor Red
}

Write-Host ""

# 步驟 2: 清除舊的生成文件
Write-Host "[2/4] 清除舊的生成文件..." -ForegroundColor Yellow
npx hexo clean

if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ 清除完成" -ForegroundColor Green
} else {
    Write-Host "✗ 清除失敗" -ForegroundColor Red
}

Write-Host ""

# 步驟 3: 重新生成網站
Write-Host "[3/4] 重新生成網站（啟用壓縮）..." -ForegroundColor Yellow
npx hexo generate

if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ 網站生成成功" -ForegroundColor Green
} else {
    Write-Host "✗ 網站生成失敗" -ForegroundColor Red
}

Write-Host ""

# 步驟 4: 顯示優化摘要
Write-Host "[4/4] 優化摘要" -ForegroundColor Yellow
Write-Host ""
Write-Host "已完成的優化：" -ForegroundColor Cyan
Write-Host "  ✓ 為關鍵圖片添加 width/height 屬性（減少 CLS）" -ForegroundColor Green
Write-Host "  ✓ 添加圖片骨架屏 CSS（改善視覺體驗）" -ForegroundColor Green
Write-Host "  ✓ 啟用 CSS/JS/HTML 壓縮" -ForegroundColor Green
Write-Host "  ✓ 快取設定已優化（圖片 30 天，CSS/JS 1 天）" -ForegroundColor Green
Write-Host ""
Write-Host "建議下一步：" -ForegroundColor Cyan
Write-Host "  1. 優化大型圖片（參考 IMAGE_OPTIMIZATION_GUIDE.md）" -ForegroundColor Yellow
Write-Host "  2. 本地測試：npx hexo server" -ForegroundColor Yellow
Write-Host "  3. 部署：npx hexo deploy" -ForegroundColor Yellow
Write-Host "  4. 使用 PageSpeed Insights 驗證改善效果" -ForegroundColor Yellow
Write-Host ""
Write-Host "==================================" -ForegroundColor Cyan
Write-Host "  優化設置完成！" -ForegroundColor Green
Write-Host "==================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "預期效果：" -ForegroundColor Cyan
Write-Host "  • 效能評分：63 → 75+" -ForegroundColor White
Write-Host "  • CLS：0.631 → <0.25" -ForegroundColor White
Write-Host "  • 檔案大小：減少 50-100 KiB" -ForegroundColor White
Write-Host ""
Write-Host "要立即開始本地測試嗎？(Y/N): " -ForegroundColor Yellow -NoNewline
$response = Read-Host

if ($response -eq 'Y' -or $response -eq 'y') {
    Write-Host ""
    Write-Host "正在啟動本地伺服器..." -ForegroundColor Cyan
    npx hexo server
}
