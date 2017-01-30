name = "#{@doctor.salutation} #{@doctor.first_name} #{@doctor.last_name}"

json.id @doctor.id
json.name name
json.address "#{@doctor.street_number} #{@doctor.street}"
json.address2 "#{@doctor.city}, #{@doctor.state} #{@doctor.zip_code}"
json.distance "1.2 miles" ##TODO
json.image_url @doctor.image_url
json.favorited @user.favorite_doctors.include?(Doctor.first)

json.first_day @doctor_schedule do |schedule|
  json.time schedule.time
  status = "Open"
  if @doctor.blocked_times.map { |blocked_time| blocked_time.time_slot }.include?(schedule)
    status = "N/A"
  elsif @doctor.appointments.map { |appointment| appointment.time_slot }.include?(schedule)
    status = "Full"
  end
  json.status status
  date = schedule.appointment_date.appointment_date
  json.date "#{date.strftime("%m")}/#{date.strftime("%d")} (#{date.strftime("%a")})"
end

json.second_day @doctor_schedule_2 do |schedule|
  json.time schedule.time
  status = "Open"
  if @doctor.blocked_times.map { |blocked_time| blocked_time.time_slot }.include?(schedule)
    status = "N/A"
  elsif @doctor.appointments.map { |appointment| appointment.time_slot }.include?(schedule)
    status = "Full"
  end
  json.status status
  date = schedule.appointment_date.appointment_date
  json.date "#{date.strftime("%m")}/#{date.strftime("%d")} (#{date.strftime("%a")})"
end

json.third_day @doctor_schedule_3 do |schedule|
  json.time schedule.time
  status = "Open"
  if @doctor.blocked_times.map { |blocked_time| blocked_time.time_slot }.include?(schedule)
    status = "N/A"
  elsif @doctor.appointments.map { |appointment| appointment.time_slot }.include?(schedule)
    status = "Full"
  end
  json.status status
  date = schedule.appointment_date.appointment_date
  json.date "#{date.strftime("%m")}/#{date.strftime("%d")} (#{date.strftime("%a")})"
end
