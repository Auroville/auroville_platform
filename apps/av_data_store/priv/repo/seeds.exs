# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     AVDataStore.Repo.insert!(%AVDataStore.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.


AVDataStore.Repo.insert!(%AVDataStore.Transport.Vehicle{
  name: "Sporty e-cycle",
  description: "Men's e-cycle",
  picture: "https://proxy.duckduckgo.com/iu/?u=http%3A%2F%2Fstephboreldesign.com%2Fwp-content%2Fuploads%2F2012%2F03%2Florem-ipsum-logo.jpg&f=1",
  type: "Electronic cycle"
})

AVDataStore.Repo.insert!(%AVDataStore.Transport.Vehicle{
  name: "Step through e-cycle",
  description: "Women's e-cycle",
  picture: "https://proxy.duckduckgo.com/iu/?u=http%3A%2F%2Fstephboreldesign.com%2Fwp-content%2Fuploads%2F2012%2F03%2Florem-ipsum-logo.jpg&f=1",
  type: "Electronic cycle"
})
