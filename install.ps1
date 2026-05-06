# Instalador Harness — Windows PowerShell
# Copia configurações globais de harness para AppData/Claude, .cursor/, .codex/

param(
    [switch]$Force = $false
)

$ErrorActionPreference = "Stop"

# Resolver paths
$RepoDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$DotfilesDir = Join-Path $RepoDir "dotfiles"

Write-Host "🚀 Instalando Harness" -ForegroundColor Green
Write-Host "📍 Repositório: $RepoDir"
Write-Host ""

# Detectar ambiente
Write-Host "🔍 Detectando ambiente Windows..." -ForegroundColor Cyan

$HomeDir = $env:USERPROFILE
$AppdataDir = $env:APPDATA

# Resolver paths Windows
$ClaudeConfigDir = Join-Path $AppdataDir "Claude"
$CursorConfigDir = Join-Path $HomeDir ".cursor"
$CodexConfigDir = Join-Path $HomeDir ".codex"

Write-Host "   HOME: $HomeDir"
Write-Host "   APPDATA: $AppdataDir"
Write-Host "   CLAUDE: $ClaudeConfigDir"
Write-Host "   CURSOR: $CursorConfigDir"
Write-Host "   CODEX: $CodexConfigDir"
Write-Host ""

# Função helper para copiar arquivos
function Copy-Dotfiles {
    param(
        [string]$SourceDir,
        [string]$DestDir,
        [string]$ToolName
    )

    Write-Host "📦 Instalando para $ToolName..." -ForegroundColor Cyan

    if (-not (Test-Path $SourceDir)) {
        Write-Host "  ⚠️  Fonte não encontrada: $SourceDir" -ForegroundColor Yellow
        return
    }

    # Criar diretório destino
    if (-not (Test-Path $DestDir)) {
        New-Item -ItemType Directory -Path $DestDir -Force | Out-Null
    }

    # Copiar arquivos (recursivamente)
    Get-ChildItem -Path $SourceDir -Recurse -File | ForEach-Object {
        $RelativePath = $_.FullName.Substring($SourceDir.Length + 1)
        $DestPath = Join-Path $DestDir $RelativePath

        # Criar diretório se necessário
        $DestFolder = Split-Path $DestPath
        if (-not (Test-Path $DestFolder)) {
            New-Item -ItemType Directory -Path $DestFolder -Force | Out-Null
        }

        if ((Test-Path $DestPath) -and -not $Force) {
            Write-Host "  ⏭️  $RelativePath já existe — pulando" -ForegroundColor Yellow
        } else {
            Copy-Item -Path $_.FullName -Destination $DestPath -Force
            Write-Host "  ✅ $RelativePath" -ForegroundColor Green
        }
    }

    Write-Host "  ✅ $ToolName OK" -ForegroundColor Green
    Write-Host ""
}

# Instalar Claude Code
Copy-Dotfiles (Join-Path $DotfilesDir "claude") $ClaudeConfigDir "Claude Code"

# Instalar Cursor
Copy-Dotfiles (Join-Path $DotfilesDir "cursor") $CursorConfigDir "Cursor"

# Instalar Codex
Copy-Dotfiles (Join-Path $DotfilesDir "codex") $CodexConfigDir "Codex"

# Instalar ~/CLAUDE.md (home-level)
$HomeClaude = Join-Path $HomeDir "CLAUDE.md"
if (-not (Test-Path $HomeClaude)) {
    Copy-Item -Path (Join-Path $DotfilesDir "home" "CLAUDE.md") -Destination $HomeClaude
    Write-Host "✅ ~/CLAUDE.md instalado" -ForegroundColor Green
} else {
    Write-Host "⏭️  ~/CLAUDE.md já existe — pulando" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "✨ Instalação concluída!" -ForegroundColor Green
Write-Host ""
Write-Host "📋 Resumo:" -ForegroundColor Cyan
Write-Host "  • ~/CLAUDE.md — Instrução imperativa (lido automaticamente)"
Write-Host "  • ~/.claude/ (AppData\Claude) — Claude Code harness"
Write-Host "  • ~/.cursor/ — Cursor harness"
Write-Host "  • ~/.codex/ — Codex CLI harness"
Write-Host ""
Write-Host "📝 Próximos passos:" -ForegroundColor Cyan
Write-Host "  1. Abrir novo PowerShell/Cursor/Claude"
Write-Host "  2. Ir para um projeto: cd C:\Users\seu-usuario\Projetos\seu-projeto"
Write-Host "  3. Ferramenta deve aplicar harness automaticamente"
Write-Host "  4. Executar: bash scripts/init.sh (ou .\scripts\init.ps1 se existir)"
Write-Host ""
Write-Host "📚 Referência:" -ForegroundColor Cyan
Write-Host "  • Harness: ~/.claude/HARNESS.md ou ~/.cursor/HARNESS.md"
Write-Host "  • Atualizar: git pull && .\install.ps1"
Write-Host ""
Write-Host "💡 Nota: Use -Force para sobrescrever arquivos existentes" -ForegroundColor Yellow
