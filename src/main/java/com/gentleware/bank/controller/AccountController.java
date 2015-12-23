package com.gentleware.bank.controller;

import com.gentleware.bank.breadcrumbs.Breadcrumbs;
import com.gentleware.bank.domain.Account;
import com.gentleware.bank.repository.AccountRepository;
import com.gentleware.bank.repository.ClientRepository;
import com.gentleware.bank.repository.PaymentRepository;
import com.gentleware.bank.validation.AccountValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "/accounts")
public class AccountController {

    private PaymentRepository paymentRepository;
    private AccountRepository accountRepository;
    private AccountValidator accountValidator;
    private ClientRepository clientRepository;

    public AccountController() {
    }

    @Autowired
    public AccountController(AccountRepository accountRepository, AccountValidator accountValidator,
                             ClientRepository clientRepository, PaymentRepository paymentRepository) {
        this.accountRepository = accountRepository;
        this.accountValidator = accountValidator;
        this.clientRepository = clientRepository;
        this.paymentRepository = paymentRepository;
    }

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String list(Model model) {
        List<Breadcrumbs> breadcrumbs = new ArrayList<>();
        breadcrumbs.add(new Breadcrumbs("title.accounts", "#"));

        List<Account> accounts = this.accountRepository.listAll();
        model.addAttribute("accounts", accounts);
        model.addAttribute("breadcrumbs", breadcrumbs);
        model.addAttribute("maxAccount", this.accountRepository.getAccountWithMaxBalance());

        return "accounts/list";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add(Model model) {
        List<Breadcrumbs> breadcrumbs = new ArrayList<>();
        breadcrumbs.add(new Breadcrumbs("title.accounts", "/accounts"));
        breadcrumbs.add(new Breadcrumbs("account.add_account", "#"));

        model.addAttribute("account", new Account());
        model.addAttribute("clients", this.clientRepository.listAll());
        model.addAttribute("breadcrumbs", breadcrumbs);
        return "accounts/add";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String add(@ModelAttribute("account") Account account, BindingResult bindingResult) {
        account.setNumber((int) (Math.random() * (99999999-10000000) + 10000000));
        account.setActive(true);
        this.accountValidator.validate(account, bindingResult);

        if (bindingResult.hasErrors()) {
            return "accounts/add";
        }

        this.accountRepository.addAccount(account);
        return "redirect:/accounts";
    }

    @RequestMapping(value = "/show/{id}", method = RequestMethod.GET)
    public String show(@PathVariable Integer id, Model model) {
        Account account = this.accountRepository.getAccountById(id);
        if (account == null) {
            return "redirect:/accounts";
        }

        List<Breadcrumbs> breadcrumbs = new ArrayList<>();
        breadcrumbs.add(new Breadcrumbs("title.accounts", "/accounts"));
        breadcrumbs.add(new Breadcrumbs("account.show_account", "#"));

        model.addAttribute("account", account);
        model.addAttribute("payments", paymentRepository.getPaymentsByAccountId(account.getId()));

        model.addAttribute("breadcrumbs", breadcrumbs);
        return "accounts/show";
    }
}
