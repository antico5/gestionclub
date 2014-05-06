class PeriodosMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.periodos_mailer.notify_liquidation.subject
  #
  def notify_liquidation
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
