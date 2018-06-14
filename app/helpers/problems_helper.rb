module ProblemsHelper

  def valid_problems
    Problem.all.where('"starts_at" < ? AND "ends_at" > ?', Date.today, Date.today)
  end

  def date_next_design_event(problem)
    design_events = problem.project.design_events.order(:starts_at).where("starts_at >= ?", Date.today)
    if design_events.any?
      design_events.first.starts_at
    end
  end

  def get_status(problem)
    # Si esta dentro del periodo para hacer propuestas, o aun no comienza => Propuestas
    if (Date.today <= problem.ends_at)
      p = Problem.find(problem.id)
      p.status = 'Propuestas'
      p.save
      return 'Propuestas'
    # Si no existen fechas de implementación y/o evaluación => Talleres
    elsif (problem.project.implementation_starts_at.nil? && problem.project.evaluation_starts_at.nil?)
      p = Problem.find(problem.id)
      p.status = 'Diseño'
      p.save
      return 'Diseño'
    # Si estas en tiempo de implementación
    elsif (Date.today >= problem.project.implementation_starts_at && Date.today <= problem.project.implementation_ends_at)
      p = Problem.find(problem.id)
      p.status = 'Implementación'
      p.save
      return 'Implementación'
    # Si estas en tiempo evaluacion
    elsif (Date.today >= problem.project.evaluation_starts_at && Date.today <= problem.project.evaluation_ends_at)
      p = Problem.find(problem.id)
      p.status = 'Implementación'
      p.save
      return 'Implementación'
    # Si no estas en tiempo implementación, ni evaluación y la fecha es menor que la de implementación
    elsif (Date.today <= problem.project.implementation_starts_at)
      p = Problem.find(problem.id)
      p.status = 'Diseño'
      p.save
      return 'Diseño'
    # Si no => cerrado
    else
      p = Problem.find(problem.id)
      p.status = 'Cerrado'
      p.save
      return 'Cerrado'
    end
  end

end
