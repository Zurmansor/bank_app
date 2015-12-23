package com.gentleware.bank.controller;

        import com.gentleware.bank.breadcrumbs.Breadcrumbs;
        import com.gentleware.bank.domain.Payment;
        import com.gentleware.bank.repository.AccountRepository;
        import com.gentleware.bank.repository.PaymentRepository;
        import com.gentleware.bank.utils.Encryption;
        import com.gentleware.bank.validation.PaymentValidator;
        import org.springframework.beans.factory.annotation.Autowired;
        import org.springframework.stereotype.Controller;
        import org.springframework.ui.Model;
        import org.springframework.validation.BindingResult;
        import org.springframework.web.bind.annotation.*;

        import java.security.NoSuchAlgorithmException;
        import java.util.ArrayList;
        import java.util.List;

@Controller
public class PaymentController {

    private PaymentRepository paymentRepository;
    private PaymentValidator paymentValidator;
    private AccountRepository accountRepository;

    public PaymentController() {
    }

    @Autowired
    public PaymentController(PaymentRepository paymentRepository, PaymentValidator paymentValidator, AccountRepository accountRepository) {
        this.paymentRepository = paymentRepository;
        this.paymentValidator = paymentValidator;
        this.accountRepository = accountRepository;
    }

    @RequestMapping(value = "/payments", method = RequestMethod.GET)
    public String list(Model model) {
        List<Breadcrumbs> breadcrumbs = new ArrayList<>();
        breadcrumbs.add(new Breadcrumbs("title.payments", "#"));

        List<Payment> payments = this.paymentRepository.listAll();
        model.addAttribute("payments", payments);
        model.addAttribute("breadcrumbs", breadcrumbs);

        return "payments/list";
    }

    @RequestMapping(value = "/payments/add", method = RequestMethod.GET)
        public String add(Model model) {

        List<Breadcrumbs> breadcrumbs = new ArrayList<>();
        breadcrumbs.add(new Breadcrumbs("title.payments", "/payments"));
        breadcrumbs.add(new Breadcrumbs("payment.add_payment", "#"));

        model.addAttribute("payment", new Payment());
        model.addAttribute("accounts", accountRepository.listAll());
        model.addAttribute("breadcrumbs", breadcrumbs);

        return "payments/add";
    }

    @RequestMapping(value = "/payments/add", method = RequestMethod.POST)
    public String add(@ModelAttribute("payment") Payment payment, BindingResult bindingResult, Model model) {
        try {
            String transactionId = Encryption.md5Encode(System.currentTimeMillis());
            payment.setTransactionId(transactionId);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }

        this.paymentValidator.validate(payment, bindingResult);

        if (bindingResult.hasErrors()) {
            List<Breadcrumbs> breadcrumbs = new ArrayList<>();
            breadcrumbs.add(new Breadcrumbs("title.payments", "/payments"));
            breadcrumbs.add(new Breadcrumbs("payment.add_payment", "#"));

            model.addAttribute("accounts", accountRepository.listAll());
            model.addAttribute("breadcrumbs", breadcrumbs);
            return "payments/add";
        }

        this.paymentRepository.addPayment(payment);
        return "redirect:/payments";
    }

}
