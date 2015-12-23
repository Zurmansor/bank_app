package com.gentleware.bank.validation;

        import com.gentleware.bank.domain.Payment;
        import org.springframework.stereotype.Component;
        import org.springframework.validation.Errors;
        import org.springframework.validation.ValidationUtils;
        import org.springframework.validation.Validator;

@Component
public class PaymentValidator implements Validator {

    @Override
    public boolean supports(Class<?> aClass) {
        return Payment.class.isAssignableFrom(aClass);
    }


    @Override
    public void validate(Object o, Errors errors) {
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "amount", "required.amount", "Amount is required.");

        Payment payment = (Payment) o;

        if (payment.getAmount() == null || payment.getAmount() < 10) {
            errors.rejectValue("amount", "invalid.amount", "Amount can not be less then 10");
        }

        if (payment.getSenderAccountId() == payment.getRecipientAccountId()) {
            errors.rejectValue("amount", "invalid.amount", "You can not send money to the same client");
        }

    }

}
