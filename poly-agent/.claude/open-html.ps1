$reader = New-Object System.IO.StreamReader([Console]::OpenStandardInput(), [System.Text.Encoding]::UTF8)
$raw = $reader.ReadToEnd()
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$j = $raw | ConvertFrom-Json
$f = if ($j.tool_response -and $j.tool_response.filePath) { $j.tool_response.filePath } else { $j.tool_input.file_path }
if ($f -and ($f -match '\.html$')) { Start-Process $f }