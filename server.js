const express = require("express");
const { exec } = require("child_process");
const path = require("path");

const app = express();
const PORT = 3000;

// Servir o index.html
app.use(express.static(__dirname));

// Rota para executar o .bat
app.get("/executar/:opcao", (req, res) => {
  const opcao = req.params.opcao;
  const batPath = path.join(__dirname, "Acelerador de disco.bat");

  exec(`"${batPath}" ${opcao}`, (error, stdout, stderr) => {
    if (error) {
      return res.send(`❌ Erro: ${error.message}`);
    }
    if (stderr) {
      return res.send(`⚠️ Aviso: ${stderr}`);
    }
    res.send(stdout || "✅ Comando executado com sucesso!");
  });
});

app.listen(PORT, () => {
  console.log(`🚀 Servidor rodando em http://localhost:${PORT}`);
});
