# frozen_string_literal: true

# Importmap configuration for Administrador gem
pin "administrador", to: "administrador/application.js"

# Pin all JavaScript files from the administrador directory
pin_all_from Administrador::Engine.root.join("app/javascript/administrador"), under: "administrador"
