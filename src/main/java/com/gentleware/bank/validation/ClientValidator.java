package com.gentleware.bank.validation;

        import com.gentleware.bank.domain.Client;
        import org.springframework.stereotype.Component;
        import org.springframework.validation.Errors;
        import org.springframework.validation.ValidationUtils;
        import org.springframework.validation.Validator;

@Component
public class ClientValidator implements Validator {

    @Override
    public boolean supports(Class<?> aClass) {
        return Client.class.isAssignableFrom(aClass);
    }

    /**
     * Validates client's data. Login is required. Login can not be more then 20 symbols.
     * FirstName can not be more then 30 symbols. LastName can not be more then 30 symbols.
     * Email can not be more then 45 symbols.
     * @param o
     * @param errors
     */
    @Override
    public void validate(Object o, Errors errors) {
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "firstName", "required.firstName", "First name is required.");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "lastName", "required.lastName", "Last name is required.");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "required.email", "Email is required.");

        Client client = (Client) o;

        if (client.getFirstName().length() > 30) {
            errors.rejectValue("firstName", "invalid.firstName", "FirstName can not be more then 30 symbols");
        }
        if (client.getLastName().length() > 30) {
            errors.rejectValue("lastName", "invalid.lastName", "LastName can not be more then 30 symbols");
        }
        if (client.getEmail().length() > 45) {
            errors.rejectValue("email", "invalid.email", "Email can not be more then 45 symbols");
        }
    }

}
