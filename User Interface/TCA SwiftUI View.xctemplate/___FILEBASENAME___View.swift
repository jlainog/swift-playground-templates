import SwiftUI
import ComposableArchitecture

public struct ___VARIABLE_productName___View: View {
    
    let store: Store<<#State#>, <#Action#>>
    
    public init(store: Store<<#State#>, <#Action#>>) {
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(store) { viewStore in
            EmptyView()
        }
    }
}

struct ___VARIABLE_productName___View_Previews: PreviewProvider {
    static var previews: some View {
        ___VARIABLE_productName___View(
            store: Store(
                initialState: <#State#>,
                reducer: <#reducer#>,
                environment: <#Environment#>
            )
        )
    }
}
