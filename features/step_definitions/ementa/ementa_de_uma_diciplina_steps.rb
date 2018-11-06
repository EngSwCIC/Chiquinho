# This is the steps file referred to ementa_de_uma_diciplina feature
# Place your code relative to that feature here

Dado("que eu estou na página dessa matéria") do
  visit subject_path(@subject.id)
end

#Então("eu devo ser redirecionado para a página da ementa") do
#  pending
#end

Então("devo ver a ementa da matéria") do
  expect(page).to have_content @ementa
end

Dado("que tenha ementa: {string}") do |string|
  @subject.update({"ementa": string})
  @ementa = string
end
