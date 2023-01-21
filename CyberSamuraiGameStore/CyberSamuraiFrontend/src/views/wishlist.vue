<template>
  <div>
    <v-col>
        <v-data-table
          :headers="headers"
          :items="wishList"
          :items-per-page="5"
          class="elevation-1"
        >
          <!-- Poster Img -->
          <template v-slot:item.posterPath="{ item }">
            <v-img
              :src="localDomain + item.posterPath"
              width="150"
              height="150"
              contain
            ></v-img>
          </template>

          <!-- Buttons -->
          <template v-slot:item.actions="{ item }">
            <!-- Delete Game Btn -->
            <v-btn
              color="red"
              fab
              dark
              x-small
              elevation="2"
              @click="
                toDeleteGame = item;
                deleteDialog = true;
              "
            >
              <v-icon>mdi-delete</v-icon>
            </v-btn>
          </template>
        </v-data-table>
      </v-col>


      <v-dialog v-model="deleteDialog" width="400">
      <v-card>
        <!-- Dialog Heading -->
        <v-toolbar color="primary" dark>
          <div>Delete This Game?</div>
          <v-spacer></v-spacer>
          <v-btn icon @click="deleteDialog = false">
            <v-icon>mdi-close</v-icon>
          </v-btn>
        </v-toolbar>

        <!-- Delete Game Info -->
        <v-card-text class="pa-4">
          <v-row dense>
            <v-col cols="3" class="font-weight-bold">ID</v-col>
            <v-col cols="7">{{ toDeleteGame.id }}</v-col>
            <v-col cols="3" class="font-weight-bold">Title</v-col>
            <v-col cols="7">{{ toDeleteGame.title }}</v-col>
          </v-row>
        </v-card-text>

        <!-- Delete Game Btn -->
        <v-card-actions class="justify-end">
          <v-btn color="red" dark @click="deleteGame()">Delete</v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>

  </div>
  </template>
  <script>
import utils from "../utils/utils";
export default {
    name: "wishlist",
  
    components: {},
  
    data() {
      return {
      localDomain: utils.constant.localDomain,

      headers: [
        { text: "ID", value: "id", sortable: true },
        { text: "Poster", value: "posterPath", sortable: false },
        { text: "Title", value: "title", sortable: true },
        { text: "Budget", value: "budget", sortable: true },
        { text: "Category", value: "category.name", sortable: true },
        { text: "Platform", value: "platform.name", sortable: true },
        { text: "Actions", value: "actions", sortable: false },
      ],
      wishList: [],

      deleteDialog: false,
      toDeleteGame: {},

      errorAlert: false,

      gameCategoryList: [],
      gamePlatformList: [],
    };
    },
  
    async created() {
    await this.fetchGameCategories();
    await this.fetchGamePlatforms();
    await this.fetchGames();
    await this.fetchWishlists();
  },



  methods: {
    async fetchGames() {
      const resp = await utils.http.get("/game");
      if (resp && resp.status === 200) {
        const data = await resp.json();
        if (data) {
          this.gameList = data;
        }
      }
    },

    async fetchGameCategories() {
      const resp = await utils.http.get("/admin/category");
      if (resp && resp.status === 200) {
        const data = await resp.json();
        if (data) {
          this.gameCategoryList = data;
        }
      }
    },
    async fetchGamePlatforms() {
      const resp = await utils.http.get("/admin/platform");
      if (resp && resp.status === 200) {
        const data = await resp.json();
        if (data) {
          this.gamePlatformList = data;
        }
      }
    },

    async deleteGame() {
      const resp = await utils.http.del(
        "/admin/game/delete/" + this.toDeleteGame.id
      );
      if (resp && resp.status === 200) {
        this.deleteDialog = false;
        // Refresh Games
        await this.fetchGames();
      } else {
        this.errorAlert = true;
      }
    },

    async fetchWishlists() {
        const resp = await utils.http.get("/wishlist");
        if (resp && resp.status === 200) {
          const data = await resp.json();
          if (data) {
            this.wishlist = data;
          }
        }
      },
  },
};
</script>
