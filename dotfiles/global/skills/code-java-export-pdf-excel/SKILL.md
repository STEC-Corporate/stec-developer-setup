---
name: code-java-export-pdf-excel
description: Exportação de documentos e relatórios para PDF e Excel em aplicações Java. Use ao implementar ou alterar export PDF/Excel.
---

# Exportação PDF e Excel em Java

## PDF (cartelas)

- Serviço: `src/main/java/<base-package>/service/ExportService.java`.
- Biblioteca: iText 7 (kernel, layout, etc.); ver `pom.xml`.
- Layout: A4; margens; cabeçalho e título configuráveis via propriedades da aplicação.
- Métodos principais:
  - `exportarCartela(cartela, file)` — uma cartela.
  - `exportarCartelas(cartelas, file)` ou `exportarCartelas(cartelas, caminhoArquivo)` — várias cartelas (uma página por cartela).
  - `exportarCartelasParaBytes(cartelas)` — retorna PDF em byte[].
- Manter padrão: export para `File` e, quando útil, overload para bytes ou `String` path.

## Excel (relatórios)

- Dependência: Apache POI (poi, poi-ooxml) já em `pom.xml`.
- Pontos de uso (ainda em desenvolvimento):
  - `src/main/java/<base-package>/controller/ReportsController.java` — `exportarExcel(ActionEvent)`
  - `src/main/java/<base-package>/controller/HistoryController.java` — `exportarExcel()`
- Ao implementar: criar ou reutilizar um service de exportação (ex.: `RelatorioExcelService`); seguir o mesmo padrão de “exportar para arquivo e/ou bytes” do PDF; manter controllers finos, delegando ao service.

## Quando usar
- Use quando a tarefa estiver alinhada ao objetivo da skill.
- Use quando for necessario padrao tecnico e repetibilidade.

## Pre-condicoes
- Escopo e contexto da tarefa definidos.
- Arquivos-alvo identificados.
- Criterios de aceite minimos estabelecidos.

## Checklist de saida
- Resultado entregue e verificavel.
- Evidencias objetivas registradas.
- Riscos e proximos passos documentados.

## Cobertura de stack e dominio
- Stacks suportadas: Java, Kotlin, Python, TypeScript, React, React Native, NextJS, NestJS.
- Dominios: backend, frontend e mobile.
