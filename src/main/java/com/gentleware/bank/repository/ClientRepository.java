package com.gentleware.bank.repository;

        import com.gentleware.bank.domain.Client;
        import org.hibernate.Query;
        import org.hibernate.Session;
        import org.hibernate.SessionFactory;
        import org.springframework.beans.factory.annotation.Autowired;
        import org.springframework.stereotype.Repository;
        import org.springframework.transaction.annotation.Transactional;

        import java.util.List;
        import java.util.logging.Level;
        import java.util.logging.Logger;

@Repository
@Transactional
public class ClientRepository {
    private static Logger LOG = Logger.getLogger(ClientRepository.class.getName());

    @Autowired
    private SessionFactory sessionFactory;

    /**
     * Adds a client
     * @param client
     */
    public void addClient(Client client) {
        this.sessionFactory.getCurrentSession().save(client);
    }

    /**
     * Returns list of all clients
     * @return List<Client>
     */
    public List<Client> listAll() {
        if (LOG.isLoggable(Level.INFO)) {
            LOG.log(Level.INFO, "getting list of all clients");
        }
        return this.sessionFactory.getCurrentSession().createQuery("from Client")
                .list();
    }

    /**
     * Removes client by Id
     * @param id
     */
    public void removeClient(int id) {
        Client contact = (Client) this.sessionFactory.getCurrentSession().load(Client.class, id);
        if (null != contact) {
            this.sessionFactory.getCurrentSession().delete(contact);
            if (LOG.isLoggable(Level.INFO)) {
                LOG.log(Level.INFO, "removing client");
            }
        }
    }

    /**
     * Gets client by Id
     * @param id
     * @return Client
     */
    public Client getClientById(int id) {
        if (LOG.isLoggable(Level.INFO)) {
            LOG.log(Level.INFO, "getting client by id");
        }
        return (Client) this.sessionFactory.getCurrentSession().get(Client.class, id);
    }

    /**
     * Edits client bu Id
     * @param clientId
     * @param updatedClient
     */
    public void editClient(int clientId ,Client updatedClient) {
        Session session = sessionFactory.openSession();
        Client client = getClientById(clientId);
        client.setFirstName(updatedClient.getFirstName());
        client.setLastName(updatedClient.getLastName());
        client.setEmail(updatedClient.getEmail());
        client.setPhone(updatedClient.getPhone());
        client.setAddress(updatedClient.getAddress());
        session.update(client);
        if (LOG.isLoggable(Level.INFO)) {
            LOG.log(Level.INFO, "editing client");
        }
    }

}
