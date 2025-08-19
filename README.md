# Quiz 5G com Ranking (Supabase + Netlify)

Este projeto cria um quiz estilo Kahoot sobre 5G, com **nome de jogador** e **ranking online** usando Supabase.

## 🚧 Etapa 1 — Preparar o Supabase
1. Crie uma conta gratuita em https://supabase.com/ e clique em **New Project**.
2. No painel do projeto, abra **SQL Editor** e cole o conteúdo de `supabase.sql`. Clique **Run**.
   - Isso cria a tabela `public.ranking`, habilita RLS e políticas de *select*/*insert* para clientes.
3. Vá em **Project Settings → API** e copie:
   - `Project URL` (ex.: `https://xxxx.supabase.co`)
   - `anon public key` (começa com `eyJ...`)

## 🧩 Etapa 2 — Configurar o Front-end
1. Abra `supabase-config.js` e substitua:
   ```js
   window.SUPABASE_URL = "https://SEU_PROJECT_URL.supabase.co";
   window.SUPABASE_ANON_KEY = "SUA_ANON_PUBLIC_KEY";
   ```
2. Teste localmente: abra `index.html` no navegador. Digite um nome e jogue.
   - Ao finalizar, a pontuação será gravada no Supabase.
   - Veja o ranking em `ranking.html`.

## 🚀 Etapa 3 — Publicar (GitHub + Netlify)
1. Crie um repositório no GitHub e envie **todos os arquivos** desta pasta.
2. No Netlify, clique **Add new site → Import an existing project** e conecte seu repositório.
3. Build: é um site estático, então **não precisa** de comando de build. Apenas publique.
4. Abra a URL do Netlify para testar com outras pessoas.

## 📁 Arquivos
- `index.html`: tela de boas-vindas (nome do jogador).
- `quiz.html`: o quiz em si (usa `questions.js`).
- `ranking.html`: mostra o Top 10.
- `questions.js`: perguntas e respostas.
- `supabase-config.js`: **edite com seu URL e anon key**.
- `styles.css`: estilos visuais.
- `supabase.sql`: script para criar tabela e políticas.

## 🔒 Sobre segurança (RLS)
- As políticas permitem *insert* e *select* para `anon` e `authenticated`. É suficiente para um ranking público.
- Para produção, você pode:
  - Limitar tamanho do `username` (já limitado no input do front).
  - Adicionar *rate limit* (Netlify Functions + middleware) se quiser.
  - Validar `score` (há `check (score >= 0 and score <= 100)` no SQL). Ajuste conforme o número de perguntas.

## 🧪 Personalizar perguntas
- Edite `questions.js`. Cada item tem:
  ```js
  { q: "Pergunta", options: ["A", "B", "C", "D"], a: 0 }
  ```
  Onde `a` é o índice da alternativa correta (0=A, 1=B, ...).

## 💡 Próximas etapas (opcional)
- Adicionar **tempo** por pergunta e **bônus** por velocidade.
- Mostrar o **último score do jogador** no ranking.
- Suporte a **salas/códigos de jogo** para eventos ao vivo.
