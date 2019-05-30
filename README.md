# Chiquinho

### Professora 
- Genaina Nunes Rodrigues 

### Alunos/Desenvolvedores
- Iuri Sousa Vieira - 16/0152488
- Lucas Mariano Carvalho - 16/0133661
- Heitor de Lima Belém - 16/0123950
- Gabriel Crespo de Souza - 14/0139982

### Descrição do Projeto
O Chiquinho é uma aplicação WEB que tem o objetivo de proporcionar aos usuários, alunos da UnB, a capacidade de avaliar cursos, máterias e professores da Universidade. Além disso, através dessa aplicação, o usuário é capaz de disponibilizar seus materiais de estudos para uma determinada matéria como, por exemplo: anotações, slides e provas antigas, com o intuito de auxiliar outros alunos que estejam cursando aquela matéria.

### Versionamento Utilizado

* **Ruby** - *2.4.3*
* **Rails** - *5.2.2*

### Testes
Para realizar os testes das implementações das Features foi utilizado o BDD.

### Passo a passo para a instalação e execução do projeto:

- Primeiramente verifique se o Ruby e o Rails estão devidamente instalados e em seu versionamento correto, após verificado isso clone o repositório em sua máquina utilizando:
  ```
  git clone https://github.com/LMarianow/Chiquinho.git
  ```
  ```
  cd Chiquinho
  ```

- Digitar os seguintes comandos no terminal:

  ```
  gem install bundler
  ```
  ```
  bundler install
  ```
- Após terminar a instalação do bundler faça o povoamento da database do projeto utilizando os seguintes comandos:
  ```
  rails db:create
  ```
  ```
  rails db:migrate
  ```
  ```
  rails db:seed
  ```
- Depois de terminar de povoar a database apenas rode o seguinte comando:
  ```
  rails s
  ```

##### Exemplo de saída do 'rails s':
<p align="center">
<img src="https://i.imgur.com/EnIfpi8.jpg">
</p>

##### Exemplo pagina inicial do projeto:
<p align="center">
<img src="https://i.imgur.com/FbrBauQ.png">
</p>




