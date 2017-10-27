Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '107975049932344', '404e0d15ee27ae0886b490ef361335a7',
           scope: 'email, public_profile', display: 'popup'
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '1074030497946-lommjgaatbd9vcsq5p72ln6f395tnga1.apps.googleusercontent.com', 'HWFXoAjFq2pLhSWsi1K_lEnD', scope: ['email', 'profile',
                                                                                                                                            'https://www.googleapis.com/auth/gmail.modify'],
                                                                                                                                    access_type: 'offline'
end
