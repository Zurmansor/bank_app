package com.gentleware.bank.repository;

        import com.gentleware.bank.domain.Payment;
        import org.hibernate.SessionFactory;
        import org.springframework.beans.factory.annotation.Autowired;
        import org.springframework.stereotype.Repository;
        import org.springframework.transaction.annotation.Transactional;

        import java.util.List;
        import java.util.logging.Level;
        import java.util.logging.Logger;

@Repository
@Transactional
public class PaymentRepository {
    private static Logger LOG = Logger.getLogger(PaymentRepository.class.getName());

    @Autowired
    private SessionFactory sessionFactory;

    /**
     * Adds a payment
     * @param payment
     */
    public void addPayment(Payment payment) {
        this.sessionFactory.getCurrentSession().save(payment);
    }

    /**
     * Returns list of all payments
     * @return List<Payment>
     */
    public List<Payment> listAll() {
        if (LOG.isLoggable(Level.INFO)) {
            LOG.log(Level.INFO, "getting list of all payments");
        }
        return this.sessionFactory.getCurrentSession().createQuery("from Payment")
                .list();
    }

    public List<Payment> getPaymentsByAccountId(Integer senderAccountId) {
        List<Payment> payments = this.sessionFactory.getCurrentSession()
            .createQuery("FROM Payment WHERE senderAccountId=? OR recipientAccountId=?")
            .setParameter(0, senderAccountId)
            .setParameter(1, senderAccountId)
            .list();

        return payments;
    }

}
