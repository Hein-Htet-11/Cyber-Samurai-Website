<template>
  <div class="my-5 container">

    <v-row class="ma-0">           
      <v-col style="width:40%">
        <v-img
          class="ma-0"
          :src="localDomain + game.posterPath"
          contain
        ></v-img>
      </v-col>

      <v-col style="width:40%; margin-right:50px">
        <v-card class="game_info" style="height:200px;width:100%;">
          <div class="text-h5 ml-2 my-2">{{ game.title }}</div>
          <div class="text--h4-caption ml-2 my-2">{{ game.category.name }}</div>
          <div class="text-body-1 ml-2 my-2">{{ game.platform.name }}</div>
          <div class="text-body-1 ml-2 my-2">
            <v-row>
              <v-col cols="8">{{ game.budget }}</v-col><v-spacer></v-spacer>
               <v-col cols="2"><v-icon color=red >mdi-heart</v-icon></v-col>                
            </v-row>        
          </div>
           <v-card-actions>
              <v-btn text><v-icon color="blue" style="margin-right:15px;">mdi-cart</v-icon>Add To Cart</v-btn>
          </v-card-actions>
        </v-card> 
      </v-col>           
    </v-row> 
    <div style="height:100px"></div>
    <div>
      <v-row class="ma-0">
        <v-col class="ma-0 pa-0" style="width:40%">
          <p style="width:90%">{{ game.overview }}</p>
        </v-col>        
        <v-col style="width:40%;">
          
       <video style="width:90%;"
       class="ma-0"
        :src="localDomain + game.trailerPath"
         controls
         contain
       ></video>
        </v-col>
      </v-row>


</div>
  </div>
</template>

<script>
import utils from "../utils/utils";

export default {
  name: "game_details",

  data() {
    return {
      localDomain: utils.constant.localDomain,

      loginUser: {},

      // Game ID from Path
      game_id: this.$route.params.id,
      game: {},
    };
  },

  async created() {
    // LoginUser from Vuex
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

    await this.fetchGame();
    await this.recordGameHistory();
    await this.addWishlist();
  },

  methods: {
    async fetchGame() {
      const resp = await utils.http.get("/game/" + this.game_id);
      if (resp && resp.status === 200) {
        const data = await resp.json();
        if (data) {
          this.game = data;
        }
      }
    },
    async recordGameHistory() {
      const resp = await utils.http.post("/record/add", {
        user: {
          id: this.loginUser.id,
        },
        game: {
          id: this.game_id,
        },
      });
      if (resp && resp.status !== 200) {
        console.log("Record Game History Failed!");
      }
    },
    async addWishlist() {
      const resp = await utils.http.post("/wishlist/add", {
        user: {
          id: this.loginUser.id,
        },
        game: {
          id: this.game_id,
        },
      });
      if (resp && resp.status !== 200) {
        console.log("Adding Wishlist Failed!");
      }
    },
  },
};
</script>

<style scoped>
.container {
  margin-left: 10vw !important;
  margin-right: 10vw !important;
}

  .container {  
  margin-left: 18vw !important;
  margin-right: 17vw !important;
} 
 .cart{
    position: absolute;
    left:65%;
    transform: translateX(-65%);      
 }


</style>
