Factory.define :passenger do |passenger|
  passenger.start_latitude  { 0.0 }
  passenger.start_longitude { 0.0 }
  passenger.end_latitude  { 0.0 }
  passenger.end_longitude { 0.0 }
  passenger.token { "abc123" }
end
