
class Patient

  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def appointments
    Appointment.all.select {|appointment| appointment.patient == self}
  end

  def doctors
    appointments = Appointment.all.select {|appointment| appointment.patient == self}
        appointments.map {|x| x.doctor}
  end

  def new_appointment(date, doctor)
    Appointment.new(date, self, doctor)
  end

end 