class PeriodosMailer < ActionMailer::Base
  default from: "administracion@gestionclub.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.periodos_mailer.notify_liquidation.subject
  #
  def notify_liquidation periodo, usuario
    @periodo = periodo
    @usuario = usuario

    mail to: @usuario.email, subject: "Periodo liquidado: "+periodo.nombre, from: "GestionClub"
  end
end
