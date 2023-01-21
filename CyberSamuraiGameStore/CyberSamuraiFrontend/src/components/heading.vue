<template>  
  <v-app-bar
    app
    color="dark" style="heigth:100px"
    dark
  > 
  
    <router-link class="mx-2 navlink" to="/">
      <span class="menu" style="margin-left:20px;"><span class="yellow--text">Cyber</span><strong>Samurai</strong></span>
    </router-link>                  
    <v-text-field
            v-model="search"
            clearable
            flat
            solo-inverted
            hide-details
            prepend-inner-icon="mdi-magnify"
            label="Search"
          ></v-text-field>
    <v-spacer></v-spacer>
    <v-badge color="#FF6059" overlap content="1" class="mr-2 mt-1">
      <v-avatar size="50">          
        <router-link class="mx-2 navlink" to="/wishlist" color="white">
          <v-icon>mdi-heart</v-icon>
        </router-link>
      </v-avatar>
    </v-badge>
    <router-link class="mx-2 navlink" to="/cart"><v-icon color="white">mdi-cart</v-icon></router-link>
    <span v-if="isLogin">|
    <router-link class="mx-2 navlink" to="/profile" color="white"><v-icon color="white">mdi-account</v-icon></router-link>
  </span>
    <span v-if="!isLogin">|</span>
    <router-link v-if="!isLogin" class="mx-2 navlink" to="/register"
      >      <template v-if="$vuetify.breakpoint.mdAndUp">
        Register
</template>
      <template v-if="$vuetify.breakpoint.mdAndDown">
<v-icon color="white">mdi-account-plus</v-icon>
</template></router-link
    >
    <span v-if="!isLogin">|</span>
    <router-link v-if="!isLogin" class="mx-2 navlink" to="/login"
      >
      <template v-if="$vuetify.breakpoint.mdAndUp">
        Login
</template>
<template v-if="$vuetify.breakpoint.mdAndDown">
      <v-icon color="white">mdi-login</v-icon>
      </template></router-link
    >
    <span v-if="isLogin">|</span>
    <a v-if="isLogin" class="mx-2 navlink" @click="logout()">
      <template v-if="$vuetify.breakpoint.mdAndUp">
        Logout
</template>
      <template v-if="$vuetify.breakpoint.mdAndDown">
      <v-icon color="white">mdi-logout</v-icon>
</template>    
    </a>
   
  </v-app-bar> 
</template>

<script>
export default {
  name: "heading",

  data: () => ({
    loginUser: {},
    isLogin: false,
  }),

  created() {
    
    this.loginUser = this.$store.state.loginUser;
    this.$store.watch(
      () => {
        return this.$store.state.loginUser;
      },
      (newVal, oldVal) => {
        this.loginUser = newVal;
      },
      {
        deep: true,
      }
    );

   
    this.isLogin = this.$store.state.isLogin;
    this.$store.watch(
      () => {
        return this.$store.state.isLogin;
      },
      (newVal, oldVal) => {
        this.isLogin = newVal;
      },
      {
        deep: true,
      }
    );
  },

  methods: {
    logout() {
      this.$store.commit("logout");
      // If current path is not home page, Go to home page
      if (this.$route.path != "/") {
        this.$router.push({ path: "/" });
      }
    },
  },
};
</script>

<style scoped>
.navlink {
color: white !important;
text-decoration: none;
}
.navlink:hover {
cursor: pointer;
text-decoration: underline;
}
.navtitle {
color: white !important;
text-decoration: none;
cursor: pointer !important;
}
.menu{
font-size:20px;
font-weigth:bold;
margin-right:30px;
}
</style>