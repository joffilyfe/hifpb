class CreatePermissions < ActiveRecord::Migration[5.1]
  def change
    create_table :permissions do |t|
      t.string :title
      t.string :module
      t.string :action

      t.timestamps
    end

    create_join_table :permissions, :users do |t|
      t.index [:permission_id, :user_id]
    end

    # Authorizations
    Permission.create({title: "Can see all Authorizations", module: "authorization", action: "index"})
    Permission.create({title: "Can create Authorizations", module: "authorization", action: "create"})
    Permission.create({title: "Can delete Authorizations", module: "authorization", action: "destroy"})
    Permission.create({title: "Can see Authorizations", module: "authorization", action: "new"})
    
    # Campus
    Permission.create({title: "Can see all Campus", module: "campus", action: "index"})
    Permission.create({title: "Can import Campus", module: "campus", action: "import"})
    
    # Campus Schedule
    Permission.create({title: "Can see all Campus Schedules", module: "campus_schedule", action: "index"})
    Permission.create({title: "Can create Campus Schedules", module: "campus_schedule", action: "create"})
    Permission.create({title: "Can delete Campus Schedules", module: "campus_schedule", action: "destroy"})
    
    # Classroom
    Permission.create({title: "Can see all Classrooms", module: "classroom", action: "index"})
    Permission.create({title: "Can see a Classroom", module: "classroom", action: "show"})
    Permission.create({title: "Can create Classrooms", module: "classroom", action: "create"})
    Permission.create({title: "Can edit Classroom", module: "classroom", action: "edit"})
    Permission.create({title: "Can delete Classroom ", module: "classroom", action: "destroy"})
    
    # Course
    Permission.create({title: "Can see all Courses", module: "course", action: "index"})
    Permission.create({title: "Can import Courses", module: "course", action: "import"})
    
    # CourseSubject
    Permission.create({title: "Can see all Course Subjects", module: "course_subject", action: "index"})
    Permission.create({title: "Can import Course Subjects", module: "course_subject", action: "import"})
    
    # Laboratory
    Permission.create({title: "Can see all Courses", module: "laboratory", action: "index"})
    Permission.create({title: "Can see all Courses", module: "laboratory", action: "show"})
    Permission.create({title: "Can see all Courses", module: "laboratory", action: "create"})
    Permission.create({title: "Can see all Courses", module: "laboratory", action: "edit"})
    Permission.create({title: "Can see all Courses", module: "laboratory", action: "destroy"})
    
    # Schoolroom
    Permission.create({title: "Can see all Courses", module: "schoolroom", action: "index"})
    Permission.create({title: "Can see all Courses", module: "schoolroom", action: "show"})
    Permission.create({title: "Can see all Courses", module: "schoolroom", action: "create"})
    Permission.create({title: "Can see all Courses", module: "schoolroom", action: "edit"})
    Permission.create({title: "Can see all Courses", module: "schoolroom", action: "destroy"})
    
    # Semester
    Permission.create({title: "Can see all Semesters", module: "semester", action: "index"})
    Permission.create({title: "Can create Semesters", module: "semester", action: "create"})
    
    # Teacher
    Permission.create({title: "Can see all imported teachers", module: "teacher", action: "index"})
    Permission.create({title: "Can import Teacher", module: "teacher", action: "import"})
  end
  
end
