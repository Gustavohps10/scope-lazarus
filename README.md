<h1 align="center">
    <img src="github-assets/scope-logo-final.png" width="300"/>
    <br>
    Sistema de Controle de Orçamento para Empresas
</h1>



<div align="center">
    <img src="https://img.shields.io/github/languages/top/gustavohps10/scope-lazarus?color=BBD540&label=Pascal&logo=lazarus&logoColor=ffffff"/>
    <img src="https://img.shields.io/github/commit-activity/w/Gustavohps10/scope-lazarus?color=BBD540&label=Commits&logo=git&logoColor=ffffff"/>
    <img src="https://img.shields.io/github/created-at/gustavohps10/scope-lazarus?color=24394E&label=Created%20At&logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAACXBIWXMAAAsTAAALEwEAmpwYAAAA90lEQVR4nOXUP0oDURDH8RUrQS+gvZ1nULBOISkkVbQJewdtPElKG0s7qzTWXmDZdIGYws4ixUcWZjHE/fMCNuLAwNt5v/myMzuzWfYnDWfIO+7zSpMCmqHAEus4N/k6NEWV0wUsMQ1fYdLiqw1dmQKcJPo0BViXkuLLPuAc495mf+tv+oALXGNYNzs+1LAllrcCsY9PXOIUo4iP4rkpdt8FrASVHeMC5ziK5h/Wsa2cxy7gHd7i/BJvMcAr9urYhv4AH41AnOAdt60N/pnzEBWVTZdPcTnfYWSqbXluAw62NiBlqK9Sxqb87U2Z7VBy0ftzyP6FfQHAW4RJPOeFSAAAAABJRU5ErkJggg=="/>
    <img src="https://img.shields.io/github/license/gustavohps10/scope-lazarus?color=24394E&label=License&logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAACXBIWXMAAAsTAAALEwEAmpwYAAABJ0lEQVR4nNXTvS4EURjGcRtZ6ytBoSGhU4hOQmsLURMK0Su4AtFoNlHRuIYtuQAXoLDVFtyAgpXQkpCfnOQtxmTNWDSe5Elmnjnnf+a85z19ff9KqGKiR1e/gh3iRe96wUEetoB3bGOxR+/E3PkscBOPvyjVY2Jkgy10Mu9NXJa4mRnfSYwi4D6OS7z3bWCZUMFcuIJ1rP4ImIqPduaU258OpBsQM7mTnIl8ALc4x3T4AjfpWxHwIddr95Ev4w1jmbHjkS0VAYdzt2Eo8jpeUcuMHYxsJQusR8dPltRvNP0tTtAfPo1sJH+Hr/CM1he+xiwaUYancFKj2+o1bGC3wFM4igU2wq2UFfdG8baPYjeN8NVfAJPuwkm/Aq7hLNolOT2v/RhYpg/ppLY519mNtgAAAABJRU5ErkJggg=="/>
</div>

<div align="center">
    <br>
    <img src="github-assets/sample.png" />
</div>
<br>

# :page_with_curl: Description
<p>
A fim de elaborar o projeto de conclusão de curso, foi requisitado pelo professor do <a target="_blank" href="https://www.softwarebymaringa.com.br/realizacao/235/saber_ti.html">Saber TI</a> (programa desenvolvido pela empresa <a target="_blank" href="https://accion.com.br/">Accion Sistemas</a> em parceria com a associação Software By Maringá (SBM) e com apoio do Centro Tecnológico de Maringá – SENAI) o desenvolvimento de um sistema para gestão e controle de orçamentos.
	O SCOPE (Sistema de Controle de Orçamentos para Empresas) tem como finalidade gerar e controlar os orçamentos de produtos solicitados pelos clientes de uma instituição. 
</p>

# :game_die: Features
- [x] Controle de Acesso
- [x] Cadastro de Usuários
- [x] Cadastro de Categorias
- [x] Cadastro de Produtos
- [x] Cadastro de Clientes
- [x] Cadastro de Orçamentos
- [x] Gerar Relatórios 

# :gear: Application settings
## Database
> O arquivo SQL pode ser encontrado em: [src/banco/scope.sql](https://github.com/Gustavohps10/scope-lazarus/blob/main/src/banco/scope.sql)

## scope.ini file
> ⚠️ Renomeie o arquivo "scope-sample.ini" para "scope.ini" e configure o banco de dados
```bash
; SCOPE Settings

[DB]
DB_HOSTNAME = localhost
DB_DATABASE = postgres
DB_USER     = postgres
DB_PASSWORD = 1234
DB_PORT     = 5432
DB_PROTOCOL = postgresql
DB_LIBRARY_LOCATION =
```

# :hammer_and_wrench: Technologies
- [Lazarus](https://www.lazarus-ide.org/)
- [ZeosLib](https://zeoslib.sourceforge.io/)
- [PostgreSQL](https://www.postgresql.org/)
- [BGRAControls](https://github.com/bgrabitmap/bgracontrols/)
- [Laz Report](https://wiki.freepascal.org/LazReport_Tutorial)
- [Dbeaver](https://dbeaver.io/)

# :adult: Author
Made with 💜 Gustavo Henrique
