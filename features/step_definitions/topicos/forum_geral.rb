Dado("que eu clicar no submenu Fórum") do
  #browser.link(:href => /the\/Preferences/).exists? 
  browser.link(:text => 'Fórum').exists?

end

Então("eu devo ser redirecionado para página do fórum geral") do
  pending # Write code here that turns the phrase above into concrete actions
end

Então("enxergar os tópicos criados") do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  pending # Write code here that turns the phrase above into concrete actions
end
