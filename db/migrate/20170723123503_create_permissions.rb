class CreatePermissions < ActiveRecord::Migration[5.1]
  def change
    drop_table :authorizations

    create_table :permissions do |t|
      t.string :title
      t.string :module
      t.string :action

      t.timestamps
    end

    create_join_table :permissions, :users do |t|
      t.index [:permission_id, :user_id]
    end
    
    # Campus
    Permission.create({title: "Pode ver home de Campus", module: "campus", action: "index"})
    Permission.create({title: "Pode importar Campus", module: "campus", action: "import"})
    
    # Campus Schedule
    Permission.create({title: "Pode ver home de horarios", module: "campus_schedule", action: "index"})
    Permission.create({title: "Pode criar horarios", module: "campus_schedule", action: "create"})
    Permission.create({title: "Pode remover horarios", module: "campus_schedule", action: "destroy"})
    
    # Classroom
    Permission.create({title: "Pode ver home de turmas", module: "classroom", action: "index"})
    Permission.create({title: "Pode ver uma turma", module: "classroom", action: "show"})
    Permission.create({title: "Pode criar turmas", module: "classroom", action: "create"})
    Permission.create({title: "Pode editar turmas", module: "classroom", action: "edit"})
    Permission.create({title: "Pode remover turmas", module: "classroom", action: "destroy"})
    
    # Course
    Permission.create({title: "Pode ver home de cursos", module: "course", action: "index"})
    Permission.create({title: "Pode importar cursos", module: "course", action: "import"})
    
    # CourseSubject
    Permission.create({title: "Pode ver home de disciplinas", module: "course_subject", action: "index"})
    Permission.create({title: "Pode importar disciplinas", module: "course_subject", action: "import"})
    
    # Laboratory
    Permission.create({title: "Pode ver home de laboratorios", module: "laboratory", action: "index"})
    Permission.create({title: "Pode ver laboratorios", module: "laboratory", action: "show"})
    Permission.create({title: "Pode criar laboratorios", module: "laboratory", action: "create"})
    Permission.create({title: "Pode editar laboratorios", module: "laboratory", action: "edit"})
    Permission.create({title: "Pode remover laboratorios", module: "laboratory", action: "destroy"})
    
    # Schoolroom
    Permission.create({title: "Pode ver home de salas", module: "schoolroom", action: "index"})
    Permission.create({title: "Pode ver sala", module: "schoolroom", action: "show"})
    Permission.create({title: "Pode criar salas", module: "schoolroom", action: "create"})
    Permission.create({title: "Pode editar salas", module: "schoolroom", action: "edit"})
    Permission.create({title: "Pode remover salas", module: "schoolroom", action: "destroy"})
    
    # Semester
    Permission.create({title: "Pode ver home de os semestres", module: "semester", action: "index"})
    Permission.create({title: "Pode criar semestres", module: "semester", action: "create"})
    
    # Teacher
    Permission.create({title: "Pode ver home de professores", module: "teacher", action: "index"})
    Permission.create({title: "Pode importar professores", module: "teacher", action: "import"})

    # Lessons
    Permission.create({title: "Pode ver home de aulas", module: "lesson", action: "index"})
    Permission.create({title: "Pode cadastrar aulas", module: "lesson", action: "create"})
    Permission.create({title: "Pode atualizar aulas", module: "lesson", action: "update"})
    Permission.create({title: "Pode remover aulas", module: "lesson", action: "destroy"})

  end 
end
