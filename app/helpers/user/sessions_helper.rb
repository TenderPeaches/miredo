module User::SessionsHelper
    # if there's any log-in error that's due to bad authentication - no email/username of that name, wrong password, etc then it doesn't matter what the error was, give the same feedback to user to prevent them from being able to tell whether some emails/usernames are in use
    # allow a custom error message if ever we want to be able to filter out technical errors like 500s, etc.
    def new_session_errors(custom_message = "")
        if custom_message.present?
            [{ full_message: custom_message }]
        else
            check_steps = tag.ol do
                safe_join [
                    tag.li(t("alerts.log_in.check_1")),
                    tag.li(t("alerts.log_in.check_2")),
                    tag.li(t("alerts.log_in.check_3")),
                ]
            end

            [{ full_message: safe_join([
                tag.p(t("alerts.log_in.error")),
                check_steps,
            ])}]
        end
    end
end
