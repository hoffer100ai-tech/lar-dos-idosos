# Lar dos Idosos — Sistema de Gestão de Cuidados

Projeto do Projeto Integrador Extensionista II (ADS), feito para o Lar dos Idosos (Medianeira, PR).

Esta etapa cria o esqueleto do projeto: uma página em Vite (JavaScript) e uma API Express com a rota `GET /api/health`. A página mostra o status da API.

## Tecnologias

- Vite+ (Vanilla JavaScript)
- Node.js + Express
- dotenv

## Pré-requisitos

- Node.js 20 ou superior
- npm

## Como rodar

1. Clone o repositório e entre na pasta:

   ```bash
   git clone https://github.com/seu-usuario/lar-dos-idosos.git
   cd lar-dos-idosos
   ```

2. Instale as dependências:

   ```bash
   npm install
   ```

3. Crie o arquivo `.env` a partir do exemplo:

   ```bash
   cp .env.example .env
   ```

4. Em um terminal, suba a API (porta 3001):

   ```bash
   npm run api
   ```

5. Em outro terminal, suba o front-end (porta 5173):

   ```bash
   npm run dev
   ```

6. Abra <http://localhost:5173>. A página deve mostrar `Status da API: ok`.

Para testar a API diretamente:

```bash
curl http://localhost:3001/api/health
```

## Estrutura

```
server/index.js   API Express com GET /api/health
src/main.js       Página inicial que consulta /api/health
vite.config.ts    Proxy de /api para http://localhost:3001
.env.example      Modelo de variáveis de ambiente (o .env não vai para o GitHub)
```
