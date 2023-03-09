class StudentDecorator < Draper::Decorator
  
  delegate_all

  def ages
    "#{student.age} años"
  end

  def full_name
    "#{student.name} #{student.lastname}"
  end

  def escolarizado
    student.active_student ? 'Si' : 'No'
  end
end
