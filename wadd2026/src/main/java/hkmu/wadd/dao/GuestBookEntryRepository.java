package hkmu.wadd.dao;

import hkmu.wadd.model.GuestBookEntry;
import org.springframework.data.jpa.repository.JpaRepository;

public interface GuestBookEntryRepository extends JpaRepository<GuestBookEntry, Long> {
}
