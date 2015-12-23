package com.gentleware.bank.repository;

        import com.gentleware.bank.domain.Account;
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
public class AccountRepository {
    private static Logger LOG = Logger.getLogger(AccountRepository.class.getName());

    @Autowired
    private SessionFactory sessionFactory;

    /**
     * Adds a account
     * @param account
     */
    public void addAccount(Account account) {
        this.sessionFactory.getCurrentSession().save(account);
    }

    /**
     * Returns list of all accounts
     * @return List<Account>
     */
    public List<Account> listAll() {
        if (LOG.isLoggable(Level.INFO)) {
            LOG.log(Level.INFO, "getting list of all accounts");
        }
        return this.sessionFactory.getCurrentSession().createQuery("from Account")
                .list();
    }

    public Account getAccountById(int id) {
        if (LOG.isLoggable(Level.INFO)) {
            LOG.log(Level.INFO, "getting account by id");
        }
        return (Account) this.sessionFactory.getCurrentSession().get(Account.class, id);
    }

    public void updateAccountBalance(int accountId, double amount) {
        Session session = sessionFactory.openSession();
        Account account = getAccountById(accountId);
        account.setBalance(account.getBalance() + amount);
        session.update(account);
        if (LOG.isLoggable(Level.INFO)) {
            LOG.log(Level.INFO, "editing account");
        }
    }

    public Account getAccountWithMaxBalance () {
        List<Account> accounts = this.sessionFactory.getCurrentSession()
                .createQuery("FROM Account ORDER BY balance desc")
                .setMaxResults(1)
                .list();

        return accounts.size() > 0 ? accounts.get(0) : null;
    }
}
