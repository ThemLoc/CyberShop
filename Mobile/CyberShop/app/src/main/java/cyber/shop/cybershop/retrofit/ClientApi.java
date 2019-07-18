package cyber.shop.cybershop.retrofit;

public class ClientApi extends BaseApi{
    public CyberShopServices getCyberShopServices() {
        return this.getService(CyberShopServices.class, ConfigApi.BASE_URL);
    }
}
