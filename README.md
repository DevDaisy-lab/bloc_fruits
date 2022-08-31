# bloc_fruits

A flutter app sample, **Bloc Fruits**, shows a state management approach using **Flutter bloc** and **Equatable** packages. The app has two separate screens: ***a list of fruits and a cart***. The list of fruits represented by the **MyList** widget and the cart represented by the **MyCart** widget. The list of fruits screen includes the app bar (**MyAppBar**) and a scrolling view of many fruit items (**MyFruitItem**). The cart screen includes list of added fruits (**CartList**) and total price of added fruits (**CartTotal**).

This is **a widget tree** of the **Bloc Fruits** app:

![](https://github.com/Laura555-p/bloc_fruits/blob/master/assets/images/widget_tree1.png)

# A Flutter app structure:
# lib/main.dart

In order to track states of the object, they need to be provided to widget further down the tree. Here the **MultiBlocProvider** is used in order to provide both blocs (in this case, **ListBloc** and **CartBloc**) at once to widgets further down the tree.

The **ListBloc** and **CartBloc** instances are provided using **BlocProvider**. The **BlocProvider** provides blocs (in this case, **ListBloc** and **CartBloc**) to widgets further down the tree.

# lib/bloc/*
This directory contains the bloc classes: **ListBloc** and **CartBloc**. Two classes (in this case, **ListBloc** and **CartBloc**) are provided in the ***main.dart***. These classes respresent the app state.

# lib/model/*

This directory contains the model classes: **ListModel**, **CartModel** and an object **Fruit** skeleton.

# lib/widgets/*

This directory contains widgets (**MyAppBar**, **MyFruitItem**, **AddButton**, **CartList**, and **CartTotal**) used to construct the two screens of the app: ***a list of fruits and a cart***.

A widget **MyFruitItem** has access to the current state of the list of fruits (**ListBloc** and **ListState**) via **BlocBuilder**.

The widgets **AddButton** has access to the current state of the cart (**CartBloc** and **CartState**) via **BlocProvider**.
The widgets **CartList** has access to the current state of the cart (**CartBloc** and **CartState**) via **BlocBuilder**.

# lib/style/*

This directory contains of the app **Text Style:** ***fontFamily***, ***fontWeight***, ***fontSize*** and ***text color***.

# IOS Platform
<p align="left">
<img src="https://github.com/CodingFlutter/bloc_fruits/blob/master/assets/images/1ios.png" width="300" height="600"/> 
<img src="https://github.com/CodingFlutter/bloc_fruits/blob/master/assets/images/2ios.png" width="300"height="600"/> 
<img src="https://github.com/CodingFlutter/bloc_fruits/blob/master/assets/images/3ios.png" width="300" height="600"/>
</p>

