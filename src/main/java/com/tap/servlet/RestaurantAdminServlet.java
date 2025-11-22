package com.tap.servlet;

import com.tap.daoimpl.MenuDAOImpl;
import com.tap.daoimpl.RestaurantDAOImpl;
import com.tap.model.Menu;
import com.tap.model.Restaurant;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/restaurantAdmin")
public class RestaurantAdminServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        HttpSession session = req.getSession();
        Integer adminUserId = (Integer) session.getAttribute("userId");
        if (adminUserId == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        RestaurantDAOImpl rdao = new RestaurantDAOImpl();
        MenuDAOImpl mdao = new MenuDAOImpl();

        try {
            switch (action) {
                case "addRestaurant":
                    String name = req.getParameter("name");
                    String address = req.getParameter("address");
                    String phoneNumber = req.getParameter("phoneNumber");
                    String cusineType = req.getParameter("cusineType");
                    String deliveryTime = req.getParameter("deliveryTime");
                    float rating = Float.parseFloat(req.getParameter("rating"));
                    String isActive = req.getParameter("isActive");

                    Restaurant newRestaurant = new Restaurant(0, name, address, phoneNumber, cusineType, deliveryTime,
                            adminUserId, rating, isActive);

                    int addResResult = rdao.addRestaurant(newRestaurant);
                    if (addResResult > 0) {
                        resp.sendRedirect("restaurantAdmin?msg=Restaurant added successfully");
                    } else {
                        resp.sendRedirect("restaurantAdmin?error=Failed to add restaurant");
                    }
                    break;

                case "deleteRestaurant":
                    int restaurantIdToDelete = Integer.parseInt(req.getParameter("restaurantId"));
                    int deleteResResult = rdao.deleteRestaurant(restaurantIdToDelete);
                    if (deleteResResult > 0) {
                        resp.sendRedirect("restaurantAdmin?msg=Restaurant deleted successfully");
                    } else {
                        resp.sendRedirect("restaurantAdmin?error=Failed to delete restaurant");
                    }
                    break;

                case "addMenuItem":
                    int restaurantIdForMenu = Integer.parseInt(req.getParameter("restaurantId"));
                    String itemName = req.getParameter("itemName");
                    String description = req.getParameter("description");
                    int price = Integer.parseInt(req.getParameter("price"));
                    String isAvailable = req.getParameter("isAvailable") != null ? req.getParameter("isAvailable") : "yes";
                    float menuRating = 0.0f; // default rating

                    Menu newMenu = new Menu(restaurantIdForMenu, 0, itemName, description, price, isAvailable, menuRating);

                    int addMenuResult = mdao.addMenu(newMenu);
                    if (addMenuResult > 0) {
                        resp.sendRedirect("restaurantAdmin?msg=Menu item added successfully");
                    } else {
                        resp.sendRedirect("restaurantAdmin?error=Failed to add menu item");
                    }
                    break;

                case "deleteMenuItem":
                    int menuIdToDelete = Integer.parseInt(req.getParameter("menuId"));
                    int deleteMenuResult = mdao.deleteMenu(menuIdToDelete);
                    if (deleteMenuResult > 0) {
                        resp.sendRedirect("restaurantAdmin?msg=Menu item deleted successfully");
                    } else {
                        resp.sendRedirect("restaurantAdmin?error=Failed to delete menu item");
                    }
                    break;

                default:
                    resp.sendRedirect("restaurantAdmin?error=Invalid action");
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("restaurantAdmin?error=Exception occurred: " + e.getMessage());
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Integer adminUserId = (Integer) session.getAttribute("userId");
        if (adminUserId == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        RestaurantDAOImpl rdao = new RestaurantDAOImpl();
        MenuDAOImpl mdao = new MenuDAOImpl();

        // Fetch restaurants owned by this admin user
        List<Restaurant> restaurants = rdao.getRestaurantsByAdminUserId(adminUserId);

        // Fetch all menus of these restaurants
        List<Menu> allMenus = new ArrayList<>();
        for (Restaurant restaurant : restaurants) {
            allMenus.addAll(mdao.getAllMenusOfRestaurant(restaurant.getRestaurantId()));
        }

        req.setAttribute("restaurants", restaurants);
        req.setAttribute("allMenus", allMenus);

        req.getRequestDispatcher("restaurantadmin.jsp").forward(req, resp);
    }
}
