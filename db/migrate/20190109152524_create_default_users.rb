class CreateDefaultUsers < ActiveRecord::Migration[5.2]
  admin = User.create({ name: 'Черный властелин', email: 'admin@example.com', password: '123456' })
  admin.add_role 'admin'

  student1 = User.create({ name: 'Студент 1', email: 'stud1@example.com', password: '123456' })
end
