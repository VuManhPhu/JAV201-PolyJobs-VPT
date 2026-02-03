package utils;

import jakarta.persistence.*;

public class XJPA {
    private static EntityManagerFactory factory;

    public static EntityManager getEntityManager() {
        if (factory == null || !factory.isOpen()) {
            factory = Persistence.createEntityManagerFactory("PolyJob");
        }
        return factory.createEntityManager();
    }

    public static void shutdown() {
        if (factory != null && factory.isOpen()) {
            factory.close();
        }
    }
}