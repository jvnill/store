GATEWAY_PAYMENT_URL = 'http://example.com/pay'
GATEWAY_VERIFY_URL = 'http://example.com/verify'
BANK_CONNECTED_APP_ID = 0
BANK_PUBLIC_KEY = File.read(Rails.root.join('certs', 'bank_key.pem'))
