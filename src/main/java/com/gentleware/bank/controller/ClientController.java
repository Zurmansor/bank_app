package com.gentleware.bank.controller;

import com.gentleware.bank.breadcrumbs.Breadcrumbs;
import com.gentleware.bank.domain.Client;
import com.gentleware.bank.repository.ClientRepository;
import com.gentleware.bank.validation.ClientValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
public class ClientController {

    private ClientRepository clientRepository;
    private ClientValidator clientValidator;

    public ClientController() {
    }

    @Autowired
    public ClientController(ClientRepository clientRepository, ClientValidator clientValidator) {
        this.clientRepository = clientRepository;
        this.clientValidator = clientValidator;
    }

    @RequestMapping(value = "/clients", method = RequestMethod.GET)
    public String list(Model model) {
        List<Breadcrumbs> breadcrumbs = new ArrayList<>();
        breadcrumbs.add(new Breadcrumbs("title.clients", "#"));

        List<Client> clients = this.clientRepository.listAll();
        model.addAttribute("clients", clients);
        model.addAttribute("breadcrumbs", breadcrumbs);

        return "clients/list";
    }

    @RequestMapping(value = "/clients/add", method = RequestMethod.GET)
    public String add(Model model) {
        List<Breadcrumbs> breadcrumbs = new ArrayList<>();
        breadcrumbs.add(new Breadcrumbs("title.clients", "/clients"));
        breadcrumbs.add(new Breadcrumbs("client.add_client", "#"));

        model.addAttribute("client", new Client());
        model.addAttribute("breadcrumbs", breadcrumbs);
        return "clients/add";
    }

    @RequestMapping(value = "/clients/add", method = RequestMethod.POST)
    public String add(@ModelAttribute("client") Client client, BindingResult bindingResult) {
        this.clientValidator.validate(client, bindingResult);

        if (bindingResult.hasErrors()) {
            return "clients/add";
        }

        this.clientRepository.addClient(client);
        return "redirect:/clients";
    }

    @RequestMapping(value = "/clients/show/{id}", method = RequestMethod.GET)
    public String show(@PathVariable Integer id, Model model) {
        Client client = this.clientRepository.getClientById(id);
        if (client == null) {
            return "redirect:/clients";
        }

        List<Breadcrumbs> breadcrumbs = new ArrayList<>();
        breadcrumbs.add(new Breadcrumbs("title.clients", "/clients"));
        breadcrumbs.add(new Breadcrumbs("client.show_client", "#"));

        model.addAttribute("client", client);
        model.addAttribute("breadcrumbs", breadcrumbs);
        return "clients/show";
    }

}
