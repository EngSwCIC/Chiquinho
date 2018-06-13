Quando("eu clicar no botão {string}") do |btn_enviar_comentario|
    click_link btn_enviar_comentario
end

Então("devo ver uma mensagem de erro {string}") do |msg|
    expect(page).to have_content msg
end