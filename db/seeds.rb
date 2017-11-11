# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.firs

puts "Cadastrando Administrador"
  users = User.create([{status: 'i', email: 'karlysson@gmail.com', name: 'Karlysson', sex: 'h', password: '123456', 
                        password_confirmation: '123456', permission: 'a' }])


puts "Cadastrando Estado..."

   states = State.create([{ name: 'Acre', sigla: 'AC'},
                          { name: 'Amazonas', sigla: 'AM'},
                          { name: 'Amapa', sigla: 'AP'},
                          { name: 'Bahia', sigla: 'BA'},
                          { name: 'Ceará', sigla: 'CE'},
                          { name: 'Paraná', sigla: 'PR'},
                          { name: 'Goiás', sigla: 'GO'},
                          { name: 'Minas Gerais', sigla: 'MG'},
                          { name: 'Mato Grosso', sigla: 'MT'},
                          { name: 'Mato Grosso do Sul', sigla: 'MS'},
                          { name: 'Santa Catarina', sigla: 'SC'},
                          { name: 'Rio Grade do Sul', sigla: 'RS'},
                          { name: 'Rio de Janeiro', sigla: 'RJ'},
                          { name: 'São Paulo', sigla: 'SP'},
                          { name: 'Espirito Santo', sigla: 'ES'},
                          { name: 'Rondonia', sigla: 'RO'},
                          { name: 'Roraima', sigla: 'RR'},
                          { name: 'Pará', sigla: 'PA'},
                          { name: 'Tocanthins', sigla: 'TO'},
                          { name: 'Sergipe', sigla: 'SE'},
                          { name: 'Alagoas', sigla: 'AL'},
                          { name: 'Paraíba', sigla: 'PB'},
                          { name: 'Pernambuco', sigla: 'PE'},
                          { name: 'Rio grande do Norte', sigla: 'RN'},
                          { name: 'Piauí', sigla: 'PI'},
                          { name: 'Maranhão', sigla: 'MA'}])

puts "Cadastrado com Sucesso..."


puts "Cadastrando Permissões..."
  permission = Permissions.create([{name: 'Administrador', prefix: 'a', obs: 'Controle Total'},
                                   {name: 'Coordenador', prefix: 'c', obs: ''},
                                   {name: 'Secretário(a)', prefix: 's', obs: ''},
                                   {name: 'Atendente', prefix: 't', obs: ''},
                                   {name: 'Professor', prefix: 'p', obs: ''}])

puts "Cadastrado com Sucesso..."

