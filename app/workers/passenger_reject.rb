class PassengerReject

  def self.reject(passenger_token)
    pusher = Grocer.pusher(
      certificate: "config/apns/passenger-development.pem",
      gateway: "gateway.sandbox.push.apple.com"
    )

    payload = { rejected: true }
    notification = Grocer::Notification.new(
      device_token: passenger_token,
      alert: 'No available vehicles',
      custom: payload
    )

    pusher.push(notification)
  end
  
end
