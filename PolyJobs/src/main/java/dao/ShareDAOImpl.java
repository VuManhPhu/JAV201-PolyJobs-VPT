package dao;

import entity.Share;

public class ShareDAOImpl extends AbstractDAO<Share, Long> implements ShareDAO {
	public ShareDAOImpl() {
		super(Share.class);
	}
}