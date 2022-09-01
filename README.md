# bloc_fruits

A flutter app sample, **Bloc Fruits**, shows a state management approach using **Flutter bloc** and **Equatable** (overrides == and hashCode) packages. The app has two separate screens: ***a list of fruits and a cart***. The list of fruits represented by the **MyList** widget and the cart represented by the **MyCart** widget. The list of fruits screen includes a scrolling view of many fruit items (**MyFruitItem**) with add button (**AddButton**). The cart screen includes list of added fruits (**CartList**) and total price of added fruits (**CartTotal**).

This is **a widget tree** of the **Bloc Fruits** app:

![](https://github.com/CodingFlutter/bloc_fruits/blob/master/assets/images/widget_tree.png)

# A Flutter app structure:
# lib/main.dart

In order to track states of the object, they need to be provided to widget further down the tree. Here the **MultiBlocProvider** is used in order to provide both blocs (in this case, **ListBloc** and **CartBloc**) at once to widgets further down the tree.

The **ListBloc** and **CartBloc** instances are provided by using **BlocProvider**. The **BlocProvider** creates a new two blocs: **ListBloc** and **CartBloc** with added states: **LoadList** and **LoadCart** and mades them available to widgets further down the tree.

# lib/bloc/*
This directory contains the blocs: **ListBloc** and **CartBloc**, events: **ListEvent** and **CartEvent** and states: **ListState** and **ListState**. The blocs, events, and states, respresent the app state.

# lib/model/*

This directory contains the model classes: **ListModel**, **CartModel** and an object **Fruit** skeleton.
# lib/screens/*
This directory contains widgets **MyList** and **MyCart**. They represents two different screens: list of fruit items and cart. 

A widget **MyList** containes list of **MyListFruit**, builded by **BlockBuilder<ListBloc, ListState>** on state **ListLoaded**, every fruit item is listed by it's position index (**state.myList.getByPosition(index)**). 

# lib/widgets/*

This directory contains widgets (**MyFruitItem**, **AddButton**, **CartList**, and **CartTotal**) used to construct the two screens of the app: ***a list of fruits and a cart***.

A widget **MyFruitItem** represent the item of fruit with **AddButton**.

A widget **AddButton** has access to the **CartBloc** and **CartState** via **BlocBuilder** The **BlocBuilder** handles widgets building in response to new state. In this case on the button press instead the button the check icon appears and **CartState** updates. 


The widgets **CartList** has access to the **CartBloc** and **CartState** via **BlocBuilder**. The **BlocBuilder** rebuilds **Cart** screen after **CartState** updates on the press button.

The widgets **CartTotal** has access to the **CartBloc** and **CartState** via **BlocBuilder**. The **BlocBuilder** rebuilds total price after **CartState** updates on the press button.

# lib/style/*

This directory contains of the app **Text Style:** ***fontFamily***, ***fontWeight***, ***fontSize*** and ***text color***.

# IOS Platform
<p align="left">
<img src="https://github.com/CodingFlutter/bloc_fruits/blob/master/assets/images/1ios.png" width="300" height="600"/> 
<img src="https://github.com/CodingFlutter/bloc_fruits/blob/master/assets/images/2ios.png" width="300"height="600"/> 
<img src="https://github.com/CodingFlutter/bloc_fruits/blob/master/assets/images/3ios.png" width="300" height="600"/>
</p>

# Android Platform
<p align="left" >
<img src="https://github.com/CodingFlutter/bloc_fruits/blob/master/assets/images/1android.png" width="250" height="580" hspace="40"/> 
<img src="https://github.com/CodingFlutter/bloc_fruits/blob/master/assets/images/2android.png" width="250"height="580"/> 
<img src="https://github.com/CodingFlutter/bloc_fruits/blob/master/assets/images/3android.png" width="250" height="580" hspace="40"/>
</p> 


