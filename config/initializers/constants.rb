GATEWAY_PAYMENT_URL = 'http://localhost:3001/pay'
BANK_CONNECTED_APP_ID = 14
BANK_PUBLIC_KEY = File.read(Rails.root.join('certs', 'bank_key.pem'))
