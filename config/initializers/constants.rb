GATEWAY_PAYMENT_URL = 'http://localhost:3001/pay'
GATEWAY_VERIFY_URL = 'http://localhost:3001/verify'
BANK_CONNECTED_APP_ID = 14
BANK_PUBLIC_KEY = File.read(Rails.root.join('certs', 'bank_key.pem'))
