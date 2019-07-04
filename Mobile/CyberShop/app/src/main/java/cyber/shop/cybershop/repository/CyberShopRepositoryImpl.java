package cyber.shop.cybershop.repository;

import android.content.Context;
import android.util.Log;

import com.google.gson.Gson;
import com.google.gson.JsonSyntaxException;
import com.google.gson.reflect.TypeToken;
import com.kaopiz.kprogresshud.KProgressHUD;

import java.io.IOException;
import java.lang.reflect.Type;
import java.util.List;

import cyber.shop.cybershop.entities.Brand;
import cyber.shop.cybershop.entities.Category;
import cyber.shop.cybershop.entities.CheckOut;
import cyber.shop.cybershop.entities.Product;
import cyber.shop.cybershop.retrofit.ClientApi;
import cyber.shop.cybershop.utils.CallBackData;
import cyber.shop.cybershop.utils.KProgressHUDManager;
import okhttp3.ResponseBody;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class CyberShopRepositoryImpl implements CyberShopRepository {

    ClientApi clientApi = new ClientApi();

    @Override
    public void getProduct(int id, final CallBackData<Product> callBackData) {
        Call<ResponseBody> serviceCall = clientApi.getCyberShopServices().getProduct(id);
        String url = clientApi.getCyberShopServices().getProduct(id).request().url().toString();
        Log.e("URL=", clientApi.getCyberShopServices().getProduct(id).request().url().toString());
        try {
            serviceCall.enqueue(new Callback<ResponseBody>() {
                @Override
                public void onResponse(Call<ResponseBody> call, Response<ResponseBody> response) {
                    if (response != null && response.body() != null) {
                        if (response.code() == 200) {
                            try {
                                String result = response.body().string();
                                Type type = new TypeToken<Product>() {
                                }.getType();
                                Product responseResult = new Gson().fromJson(result, type);
                                if (responseResult == null) {
                                    callBackData.onFail(response.message());
                                }
                                callBackData.onSuccess(responseResult);
                            } catch (JsonSyntaxException jsonError) {
                                jsonError.printStackTrace();
                            } catch (IOException e) {
                                e.printStackTrace();
                            }
                        } else {
                            callBackData.onFail(response.message());
                        }
                    } else if (response.code() == 400) {
                        callBackData.onFail(response.message());
                    }
                }

                @Override
                public void onFailure(Call<ResponseBody> call, Throwable t) {
                    callBackData.onFail(call.toString());
                }
            });
        } catch (Exception e) {
            callBackData.onFail(e.getMessage());
        }
    }

    @Override
    public void getProductListByCateID(int id, final CallBackData<List<Product>> callBackData) {
        Call<ResponseBody> serviceCall = clientApi.getCyberShopServices().getProductListByCateID(id);
        Log.e("URL=", clientApi.getCyberShopServices().getProductListByCateID(id).request().url().toString());
        serviceCall.enqueue(new Callback<ResponseBody>() {
            @Override
            public void onResponse(Call<ResponseBody> call, Response<ResponseBody> response) {
                if (response != null && response.body() != null) {
                    if (response.code() == 200) {
                        try {
                            String result = response.body().string();
                            Type type = new TypeToken<List<Product>>() {
                            }.getType();
                            List<Product> responseResult = new Gson().fromJson(result, type);
                            if (responseResult == null) {
                                callBackData.onFail(response.message());
                            }
                            callBackData.onSuccess(responseResult);
                        } catch (JsonSyntaxException jsonError) {
                            jsonError.printStackTrace();
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    } else {
                        callBackData.onFail(response.message());
                    }
                } else if (response.code() == 400) {
                    callBackData.onFail(response.message());
                }
            }

            @Override
            public void onFailure(Call<ResponseBody> call, Throwable t) {
                callBackData.onFail(call.toString());
            }
        });
    }

    @Override
    public void getAllCate(final CallBackData<List<Category>> callBackData) {
        Call<ResponseBody> serviceCall = clientApi.getCyberShopServices().getAllCate();
        Log.e("URL=", clientApi.getCyberShopServices().getAllCate().request().url().toString());
        serviceCall.enqueue(new Callback<ResponseBody>() {
            @Override
            public void onResponse(Call<ResponseBody> call, Response<ResponseBody> response) {
                if (response != null && response.body() != null) {
                    if (response.code() == 200) {
                        try {
                            String result = response.body().string();
                            Type type = new TypeToken<List<Category>>() {
                            }.getType();
                            List<Category> responseResult = new Gson().fromJson(result, type);
                            if (responseResult == null) {
                                callBackData.onFail(response.message());
                            }
                            callBackData.onSuccess(responseResult);
                        } catch (JsonSyntaxException jsonError) {
                            jsonError.printStackTrace();
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    } else {
                        callBackData.onFail(response.message());
                    }
                } else if (response.code() == 400) {
                    callBackData.onFail(response.message());
                }
            }

            @Override
            public void onFailure(Call<ResponseBody> call, Throwable t) {
                callBackData.onFail(call.toString());
            }
        });
    }

    @Override
    public void getBrand(final CallBackData<List<Brand>> callBackData) {
        Call<ResponseBody> serviceCall = clientApi.getCyberShopServices().getBrand();
        Log.e("URL=", clientApi.getCyberShopServices().getProductHot().request().url().toString());
        serviceCall.enqueue(new Callback<ResponseBody>() {
            @Override
            public void onResponse(Call<ResponseBody> call, Response<ResponseBody> response) {
                if (response != null && response.body() != null) {
                    if (response.code() == 200) {
                        try {
                            String result = response.body().string();
                            Type type = new TypeToken<List<Brand>>() {
                            }.getType();
                            List<Brand> responseResult = new Gson().fromJson(result, type);
                            if (responseResult == null) {
                                callBackData.onFail(response.message());
                            }
                            callBackData.onSuccess(responseResult);
                        } catch (JsonSyntaxException jsonError) {
                            jsonError.printStackTrace();
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    } else {
                        callBackData.onFail(response.message());
                    }
                } else {
                    callBackData.onFail(response.message());
                }
            }

            @Override
            public void onFailure(Call<ResponseBody> call, Throwable t) {
                callBackData.onFail(call.toString());
            }
        });
    }

    @Override
    public void getProductListByBrandID(int id, final CallBackData<List<Product>> callBackData) {
        Call<ResponseBody> serviceCall = clientApi.getCyberShopServices().getProductListByBrandID(id);
        Log.e("URL=", clientApi.getCyberShopServices().getProductListByBrandID(id).request().url().toString());
        serviceCall.enqueue(new Callback<ResponseBody>() {
            @Override
            public void onResponse(Call<ResponseBody> call, Response<ResponseBody> response) {
                if (response != null && response.body() != null) {
                    if (response.code() == 200) {
                        try {
                            String result = response.body().string();
                            Type type = new TypeToken<List<Product>>() {
                            }.getType();
                            List<Product> responseResult = new Gson().fromJson(result, type);
                            if (responseResult == null) {
                                callBackData.onFail(response.message());
                            }
                            callBackData.onSuccess(responseResult);
                        } catch (JsonSyntaxException jsonError) {
                            jsonError.printStackTrace();
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    } else {
                        callBackData.onFail(response.message());
                    }
                } else if (response.code() == 400) {
                    callBackData.onFail(response.message());
                }
            }

            @Override
            public void onFailure(Call<ResponseBody> call, Throwable t) {
                callBackData.onFail(call.toString());
            }
        });
    }

    @Override
    public void getProductHot(final CallBackData<List<Product>> callBackData) {
        Call<ResponseBody> serviceCall = clientApi.getCyberShopServices().getProductHot();
        Log.e("URL=", clientApi.getCyberShopServices().getProductHot().request().url().toString());
        serviceCall.enqueue(new Callback<ResponseBody>() {
            @Override
            public void onResponse(Call<ResponseBody> call, Response<ResponseBody> response) {
                if (response != null && response.body() != null) {
                    if (response.code() == 200) {
                        try {
                            String result = response.body().string();
                            Type type = new TypeToken<List<Product>>() {
                            }.getType();
                            List<Product> responseResult = new Gson().fromJson(result, type);
                            if (responseResult == null) {
                                callBackData.onFail(response.message());
                            }
                            callBackData.onSuccess(responseResult);
                        } catch (JsonSyntaxException jsonError) {
                            jsonError.printStackTrace();
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    } else {
                        callBackData.onFail(response.message());
                    }
                } else {
                    callBackData.onFail(response.message());
                }
            }

            @Override
            public void onFailure(Call<ResponseBody> call, Throwable t) {
                callBackData.onFail(call.toString());
            }
        });
    }

    @Override
    public void getProductNew(final CallBackData<List<Product>> callBackData) {
        Call<ResponseBody> serviceCall = clientApi.getCyberShopServices().getProductNew();
        Log.e("URL=", clientApi.getCyberShopServices().getProductNew().request().url().toString());
        serviceCall.enqueue(new Callback<ResponseBody>() {
            @Override
            public void onResponse(Call<ResponseBody> call, Response<ResponseBody> response) {
                if (response != null && response.body() != null) {
                    if (response.code() == 200) {
                        try {
                            String result = response.body().string();
                            Type type = new TypeToken<List<Product>>() {
                            }.getType();
                            List<Product> responseResult = new Gson().fromJson(result, type);
                            if (responseResult == null) {
                                callBackData.onFail(response.message());
                            }
                            callBackData.onSuccess(responseResult);
                        } catch (JsonSyntaxException jsonError) {
                            jsonError.printStackTrace();
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    } else {
                        callBackData.onFail(response.message());
                    }
                } else if (response.code() == 400) {
                    callBackData.onFail(response.message());
                }
            }

            @Override
            public void onFailure(Call<ResponseBody> call, Throwable t) {
                callBackData.onFail(call.toString());
            }
        });
    }

    @Override
    public void getBestSaleProduct(final CallBackData<List<Product>> callBackData) {
        Call<ResponseBody> serviceCall = clientApi.getCyberShopServices().getBestSaleProduct();
        Log.e("URL=", clientApi.getCyberShopServices().getBestSaleProduct().request().url().toString());
        serviceCall.enqueue(new Callback<ResponseBody>() {
            @Override
            public void onResponse(Call<ResponseBody> call, Response<ResponseBody> response) {
                if (response != null && response.body() != null) {
                    if (response.code() == 200) {
                        try {
                            String result = response.body().string();
                            Type type = new TypeToken<List<Product>>() {
                            }.getType();
                            List<Product> responseResult = new Gson().fromJson(result, type);
                            if (responseResult == null) {
                                callBackData.onFail(response.message());
                            }
                            callBackData.onSuccess(responseResult);
                        } catch (JsonSyntaxException jsonError) {
                            jsonError.printStackTrace();
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    } else {
                        callBackData.onFail(response.message());
                    }
                } else if (response.code() == 400) {
                    callBackData.onFail(response.message());
                }
            }

            @Override
            public void onFailure(Call<ResponseBody> call, Throwable t) {
                callBackData.onFail(call.toString());
            }
        });
    }

    @Override
    public void checkOut(Context context, CheckOut checkOut,final CallBackData<CheckOut> callBackData) {
        Call<ResponseBody> serviceCall = clientApi.getCyberShopServices().checkOut(checkOut);
        Log.e("URL=", clientApi.getCyberShopServices().checkOut(checkOut).request().url().toString());

        final KProgressHUD progressHUD = KProgressHUDManager.showProgressBar(context);

        serviceCall.enqueue(new Callback<ResponseBody>() {
            @Override
            public void onResponse(Call<ResponseBody> call, Response<ResponseBody> response) {
                progressHUD.dismiss();
                if (response != null && response.body() != null) {
                    if (response.code() == 200) {
                        try {
                            String result = response.body().string();
                            Type type = new TypeToken<CheckOut>() {
                            }.getType();
                            CheckOut responseResult = new Gson().fromJson(result, type);
                            if (responseResult == null) {
                                callBackData.onFail(response.message());
                            }
                            callBackData.onSuccess(responseResult);
                        } catch (JsonSyntaxException jsonError) {
                            jsonError.printStackTrace();
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    } else {
                        callBackData.onFail(response.message());
                    }
                } else if (response.code() == 400) {
                    callBackData.onFail(response.message());
                }
            }

            @Override
            public void onFailure(Call<ResponseBody> call, Throwable t) {
                callBackData.onFail(call.toString());
            }
        });
    }
}
