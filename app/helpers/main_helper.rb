module MainHelper
  def dificuldade_semestre_frase(trabalhos,provas,tarefas)
    media = (trabalhos + provas + tarefas)/3.0
    frase = "Easy peasy"
    if(media < 3)
    elsif(media < 5)
      frase = "Ta de boa ainda"
    elsif(media < 7)
      frase = "Semestre moderado, acho melhor não adicionar matérias"
    elsif(media < 9)
      frase = "Semestre dificil, vai com calma parça"
    else
      frase = "Semestre bem foda, cuidado aí fera, meça sua grade horária"
    end

    frase
  end
end
