import "./style.css";

document.querySelector("#app").innerHTML = `
<main>
  <h1>Lar dos Idosos</h1>
  <p id="status">Status da API: consultando...</p>
  <p id="dataHora"></p>
</main>
`;

async function verificarApi() {
  const statusEl = document.querySelector("#status");
  const dataEl = document.querySelector("#dataHora");
  try {
    const resposta = await fetch("/api/health");
    const dados = await resposta.json();
    statusEl.textContent = `Status da API: ${dados.status}`;
    dataEl.textContent = `Verificado em ${new Date().toLocaleString("pt-BR")}`;
  } catch {
    statusEl.textContent = "Status da API: indisponível";
  }
}

verificarApi();
